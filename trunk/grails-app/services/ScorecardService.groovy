import groovy.text.Template
import groovy.text.SimpleTemplateEngine
import org.springframework.context.*
import org.springframework.beans.factory.InitializingBean


class ScorecardService implements ApplicationContextAware, InitializingBean {
    ApplicationContext applicationContext
    InventoryService inventoryService
    def grailsApplication

    boolean transactional = false

    def appUrl

    void afterPropertiesSet() {
        this.appUrl   = grailsApplication.config.app.url
    }


    // Returns a map of service metric scores
    // "audit", "process", "activity"
    def Map scoreByService(Service service, ScorecardParams scorecardParams, includesList) {
        def serviceScoreMap = [:]
        serviceScoreMap['service'] = service

        if (includesList.contains('audit')) {
            serviceScoreMap['audit'] = listAuditScorecards(scorecardParams)
        }
        if (includesList.contains('process')) {
            serviceScoreMap['process'] = listProcessScorecards(
                    ServiceManagementProcess.constraints.category.inList.sort(),
                    service.name, service.type, null)
        }
        if (includesList.contains('activity')) {
            serviceScoreMap['activity'] = listProcessReceiptScorecards(scorecardParams)
        }
        if (includesList.contains('inventory')) {
            serviceScoreMap['inventory'] = listInventoryScorecards(scorecardParams)
        }

        return serviceScoreMap
    }

    //  Generate a scorecard report for the given service
    // returns bodyContent: HTML markup
    def String generateScoresReportAsText(Service service,
                                          ScorecardParams scorecardParams,
                                          List includeList) {
        def String bodyContent

        def serviceScoreMap = scoreByService(service, scorecardParams, includeList)
        def templateFileName = "service-scorecard-report.gtpl"
        File tplFile = applicationContext.getResource(File.separator + "WEB-INF" + File.separator
                + templateFileName).getFile();
        def binding = ["service":service, "serviceScoreMap": serviceScoreMap, "appUrl":this.appUrl]

        def engine = new SimpleTemplateEngine()
        def template = engine.createTemplate(tplFile).make(binding)
        bodyContent = template.toString()

        return bodyContent
    }


    //------Capability Audits -------------------------------------------------
    //
    // Returns a map of AuditScorecard values keyed by Service.id
    def listAuditScorecards(ScorecardParams params) {
        def results = [:]
        def querymap = [:]
        if (params.service) querymap['name'] = params.service.name

        def services = Service.findAllWhere(querymap)
        services.each {service ->
            def scorecards = []
            def matches = CapabilityAudit.findAllByAuditDateBetweenAndService(
                    params.startDate, params.endDate, service)
            println("DEBUG: listAuditScorecards: number matching=${matches.size()}")
            matches.each {
                def scores = it.calculateScores()
                scorecards << new AuditScorecard(service: service, audit: it, scores: scores)
                println("DEBUG: Added '${it.title}' audit scorecard for service: ${service.name}")    
            }
            results[service.id] = scorecards

        }

        return results
    }

    //------Change Receipts ---------------------------------------------------
    //
    def listProcessReceiptScorecards(ScorecardParams params) {
        def results = []
        def matches = []
        if (params?.service) {
            println("DEBUG: ScorecardService#listProcessReceiptScorecards: service=${params.service}")

            matches = ProcessReceipt.findAllByDateBetweenAndService(
                    params.startDate, params.endDate, params.service)
        } else {
            matches = ProcessReceipt.findAllByDateBetween(
                    params.startDate, params.endDate)
            println("DEBUG: ScorecardService#listProcessReceiptScorecards: NO SERVICE")

        }
        println("DEBUG: ScorecardService#listProcessReceiptScorecards: matches.size()=${matches.size()}")

        matches.each {
            def scores = it.calculateScores()
            results << new ProcessReceiptScorecard(receipt: it, scores: scores)
        }
        return results
    }

    //------Service Management Process ----------------------------------------
    //
    // Returns a map of ProcessScorecard values keyed by Service.id
    def listProcessScorecards(categories, serviceName, resourceType, ownerResponsible) {
        def results = [:]
        // Lookup the services that match the filter
        def querymap = [:]
        if (serviceName && !'null'.equals(serviceName)) querymap['name'] = serviceName
        if (resourceType && !'null'.equals(resourceType)) querymap['type'] = resourceType
        if (ownerResponsible && !'null'.equals(ownerResponsible)) querymap['ownerResponsible'] = ownerResponsible

        def services = Service.findAllWhere(querymap)

        services.each {service ->
            def scorecards = []
            // Iterate over the user chosen process categories
            // and see if there is a process for the service
            categories.each {category ->
                def process = ServiceManagementProcess.findWhere('category': category, 'service': service)
                // if a process is defined calculate its scores
                def scores = [:]
                if (!process) {
                    process = new ServiceManagementProcess(category: category)
                }
                scores = process.calculateScores()
                // add the scorecard to the result set
                scorecards << new ProcessScorecard(service: service, process: process, scores: scores)
            }
            results[service.id] = scorecards
            println("DEBUG: added scorecards for service ${service.name}")
        }
        return results
    }

    def  listInventoryScorecards(ScorecardParams scorecardParams) {
        def scorecards = []
        inventoryService.listAdded(scorecardParams.startDate, scorecardParams.endDate).each {
            def scores = it.calculateScores()
            scorecards << new InventoryScorecard(resource: it, scores: scores)
        }
        return scorecards
    }

}

class BaseScorecard {
    Service service
    Map scores
}

class AuditScorecard extends BaseScorecard {
    CapabilityAudit audit
}

class ProcessReceiptScorecard extends BaseScorecard {
    ProcessReceipt receipt
}

class ProcessScorecard extends BaseScorecard {
    ServiceManagementProcess process
}

class InventoryScorecard extends BaseScorecard {
    Resource resource
}

class ScorecardParams {
    Date startDate
    Date endDate
    Service service

    String toString() {
        return "ScorecardParams{startDate=${startDate},endDate=${endDate},service=${service?.id}}"
    }
}
