class ScoreController extends SecureController {
    ScorecardService scorecardService

    def index = {
        def today = new Date()

        def scorecardParams = new ScorecardParams(startDate: today - 7, endDate: today, service: null)        
        render(view: 'index', model: [scorecardParams: scorecardParams,
                capabilityScoreCardMap: [:],
                processScorecardMap: [:]])
    }



    def scoreServices = {ScoreServicesParams scoreServicesParams ->

        println("DEBUG: ScoreController#scoreServices: scoreServicesParams=${scoreServicesParams}")
        println("DEBUG: ScoreController#scoreServices: params=${params}")

        // keyed by service id
        def scoreMap = [:]
        scoreServicesParams.services.each {id ->
            if (Service.exists(id)) {
                def serviceScoreMap = [:]
                def service = Service.get(id)
                serviceScoreMap['service'] = service
                def scorecardParams = new ScorecardParams(
                        startDate: scoreServicesParams.startDate,
                        endDate: scoreServicesParams.endDate, service: service)

                scoreMap[id]=scorecardService.scoreByService(service, scorecardParams, scoreServicesParams.cards )
            }
        }
        if(!scoreServicesParams.services){
            scoreServicesParams.errors.rejectValue('services','scorecard.params.noservices')
        }

        println("DEBUG: scoreMap.size=${scoreMap.size()}")
        render(view: 'index', model:[scoreMap:scoreMap,scoreServicesParams:scoreServicesParams])
    }
    def txtAuditData = {ScoreServicesParams scoreServicesParams ->
        def scoreData
        if (Service.exists(params.id)) {
            def serviceScoreMap = [:]
            def service = Service.get(params.id)
            serviceScoreMap['service'] = service
            def scorecardParams = new ScorecardParams(
                    startDate: scoreServicesParams.startDate,
                    endDate: scoreServicesParams.endDate, service: service)

            scoreData=scorecardService.scoreByService(service, scorecardParams, ["audit"] )
            println("scoreData: ${scorecardParams}, ${scoreData}")
            StringBuffer sb = new StringBuffer()
            scoreData.audit[service.id].each{ entry->
                sb<<formatDate(format:'yyyy-MM-dd HH:mm:ssZ',date:entry.audit.auditDate)
                sb<<",${entry.scores.process},${entry.scores.control},${entry.scores.cumulative}"
                sb<<"\n"
            }
            render(contentType:"text/plain",text:sb.toString())
        }else{
            response.setContentType("text/plain")
            response.setStatus(400)
            out<<"# Error: couldn't find service with id ${params.id}\n"
        }
    }



    //----------- Capability Audit --------------------------------------------
    //
    def auditCreate = {
        render(template: 'capabilityAudit/create', model: [auditScorecard: new AuditScorecard()])
    }

    def auditSummary = {
        def today = new Date()
        def scorecardParams = new ScorecardParams(startDate: today - 7, endDate: today, service: null)
        def results = scorecardService.listAuditScorecards(scorecardParams)
        render(template: 'capabilityAudit/list', model: [scorecardParams: scorecardParams, capabilityScoreCardMap: results])
    }

    def auditList = {ScorecardParams scorecardParams ->
        def results = scorecardService.listAuditScorecards(scorecardParams)
        render(template: 'capabilityAudit/list', model: [scorecardParams: scorecardParams, capabilityScoreCardMap: results])
    }

    //----------- Service Management Process-----------------------------------
    //
    def processCreate = {
        render(template: 'serviceManagementProcess/create', model: [processScorecard: new ProcessScorecard()])
    }
    def processList = {

        println("DEBUG: params: ${params}")
        // Parse out the process category names. They are named like: category.include.<name>
        def categories = []
        params.keySet().each {key ->
            def matcher = key =~ 'category\\.include\\.(.*)'
            if (matcher.matches()) {
                if ('on' == params[key]) {
                    categories << matcher[0][1]
                }
            }
        }

        def results = scorecardService.listProcessScorecards(categories, params.serviceName,
                params.resourceType.id, params.user.id)
        println("DEBUG: results.size()=${results.size()}. keyset=${results.keySet()}")
        render(template: 'serviceManagementProcess/list', model: [scorecardParams: params, processScorecardMap: results])
    }

    def processSummary = {

        def results = scorecardService.listProcessScorecards(ServiceManagementProcess.constraints.category.inList,
                null, null, null)
        println("DEBUG: results.size()=${results.size()}. keyset=${results.keySet()}")
        render(template: 'serviceManagementProcess/list', model: [scorecardParams: params, processScorecardMap: results])

    }

    //----------- Change Receipt ----------------------------------------------
    //
    def changeCreate = {
        render(template: 'processReceipt/create', model: [processReceiptScorecard: new ProcessReceiptScorecard()])
    }

    def changeSummary = {
        def today = new Date()
        def scorecardParams = new ScorecardParams(startDate: today - 7, endDate: today, service: null)
        def results = scorecardService.listProcessReceiptScorecards(scorecardParams)
        render(template: 'processReceipt/list', model: [scorecardParams: scorecardParams, processReceiptScorecardList: results])
    }

    def changeList = {ScorecardParams scorecardParams ->
        def results = scorecardService.listProcessReceiptScorecards(scorecardParams)
        render(template: 'processReceipt/list', model: [scorecardParams: scorecardParams, processReceiptScorecardList: results])
    }

}

class ScoreServicesParams {
    Date startDate
    Date endDate
    List services
    List cards

    String toString() {
        return "ScorecardParams{startDate=${startDate},endDate=${endDate},services=${services},cards=${cards}"
    }
}
