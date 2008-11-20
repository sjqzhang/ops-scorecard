class ScorecardService {

    boolean transactional = false


    def listAuditScorecards(ScorecardParams params) {
        def results = []
        def matches = []
        if (params?.service) {
            matches = CapabilityAudit.findAllByAuditDateBetweenAndTargetedService(
                    params.startDate, params.endDate, params.service)
        } else {
            matches = CapabilityAudit.findAllByAuditDateBetween(
                    params.startDate, params.endDate)
        }

        matches.each {
            def scores = it.calculateScores()
            results << new AuditScorecard(audit: it, scores: scores)
        }
        return results
    }

    def listReceiptScorecards(ScorecardParams params) {
        def results = []
        def matches = []
        if (params?.service) {
            matches = ChangeReceipt.findAllByAuditDateBetweenAndTargetedService(
                    params.startDate, params.endDate, params.service)
        } else {
            matches = ChangeReceipt.findAllByAuditDateBetween(
                    params.startDate, params.endDate)
        }

        matches.each {
            def scores = it.calculateGrades()
            results << new ReceiptScorecard(audit: it, scores: scores)
        }
        return results
    }

    //
    // Returns a map of ProcessScorecard values keyed by Service.id
    def listProcessScorecards(categories, serviceName, resourceType, ownerResponsible) {
        def results = [:]
        // Lookup the services that match the filter
        def querymap = [:]
        if (serviceName      && !'null'.equals(serviceName)) querymap['name']=serviceName
        if (resourceType     && !'null'.equals(resourceType)) querymap['type']=resourceType
        if (ownerResponsible && !'null'.equals(ownerResponsible)) querymap['ownerResponsible']=ownerResponsible

        def services = Service.findAllWhere(querymap)

        services.each {service ->
            def scorecards = []
            // Iterate over the user chosen process categories
            // and see if there is a process for the service
            categories.each { category ->
                def process = ServiceManagementProcess.findWhere('category':category, 'targetResource':service)
                // if a process is defined calculate its scores
                def scores = [:]
                if (process) {
                    scores = process.calculateScores()
                    // add the scorecard to the result set
                    scorecards << new ProcessScorecard(service:service, process:process, scores:scores)
                }                                                                
            }
            results[service.id] = scorecards
            println("DEBUG: added scorecards for service ${service.name}")
        }
        return results
    }
}

class AuditScorecard {
    CapabilityAudit audit
    Map scores
}

class ReceiptScorecard {
    ChangeReceipt receipt
    Map scores
}

class ProcessScorecard {
    Service service
    ServiceManagementProcess process
    Map scores
}