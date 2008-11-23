class ScoreController extends SecureController {
    ScorecardService scorecardService
    
    def index = {
        def today = new Date()

        def scorecardParams = new ScorecardParams(startDate:today -7, endDate:today, service: null)
        def capabilityScoreCardList = scorecardService.listAuditScorecards(scorecardParams)
        def processScorecardMap = scorecardService.listProcessScorecards(
                ServiceManagementProcess.constraints.category.inList,  null, null, null)

        render(view: 'index', model:[scorecardParams: scorecardParams,
                capabilityScoreCardList: capabilityScoreCardList,
                processScorecardMap:processScorecardMap])
    }

    //----------- Capability Audit --------------------------------------------
    //
    def auditCreate = {        
        render(template: 'capabilityAudit/create', model: [auditScorecard:new AuditScorecard()])
    }

    def auditSummary = {
        def today = new Date()
        def scorecardParams = new ScorecardParams(startDate: today - 7, endDate: today, service: null)
        def results = scorecardService.listAuditScorecards(scorecardParams)
        render(template: 'capabilityAudit/list', model: [scorecardParams: scorecardParams, capabilityScoreCardList: results])
    }

    def auditList = {ScorecardParams scorecardParams ->
        def results = scorecardService.listAuditScorecards(scorecardParams)
        render(template: 'capabilityAudit/list', model: [scorecardParams: scorecardParams, capabilityScoreCardList: results])
    }

    //----------- Service Management Process-----------------------------------
    //
    def processCreate = {
        render(template: 'serviceManagementProcess/create',model:[processScorecard:new ProcessScorecard()])
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
         render(template: 'changeReceipt/create', model: [changeReceiptScorecard:new ChangeReceiptScorecard()])
     }

     def changeSummary = {
         def today = new Date()
         def scorecardParams = new ScorecardParams(startDate: today - 7, endDate: today, service: null)
         def results = scorecardService.listChangeReceiptScorecards(scorecardParams)
         render(template: 'changeReceipt/list', model: [scorecardParams: scorecardParams, changeReceiptScorecardList: results])
     }

     def changeList = {ScorecardParams scorecardParams ->
         def results = scorecardService.listChangeReceiptScorecards(scorecardParams)
         render(template: 'changeReceipt/list', model: [scorecardParams: scorecardParams, changeReceiptScorecardList: results])
     }

}