class ServiceManagementProcessController extends SecureController {
    ScorecardService scorecardService


    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [serviceManagementProcessList: ServiceManagementProcess.list(params)]
    }

    def show = {
        def serviceManagementProcess = ServiceManagementProcess.get(params.id)

        if (!serviceManagementProcess) {
            flash.message = "ServiceManagementProcess not found with id ${params.id}"
            redirect(action: list)
        }
        else {return [serviceManagementProcess: serviceManagementProcess]}
    }

    def delete = {
        def serviceManagementProcess = ServiceManagementProcess.get(params.id)
        if (serviceManagementProcess) {
            serviceManagementProcess.delete()
            flash.message = "Deleted: '${params.id}'"
            redirect(action: list)
        }
        else {
            flash.message = "ServiceManagementProcess not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def serviceManagementProcess = ServiceManagementProcess.get(params.id)

        if (!serviceManagementProcess) {
            flash.message = "ServiceManagementProcess not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [serviceManagementProcess: serviceManagementProcess]
        }
    }

    def update = {
        def serviceManagementProcess = ServiceManagementProcess.get(params.id)
        if (serviceManagementProcess) {
            serviceManagementProcess.properties = params
            if (!serviceManagementProcess.hasErrors() && serviceManagementProcess.save()) {
                flash.message = "Updated: ${params.name}"
                redirect(action: list)
            }
            else {
                render(view: 'edit', model: [serviceManagementProcess: serviceManagementProcess])
            }
        }
        else {
            flash.message = "ServiceManagementProcess not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def serviceManagementProcess = new ServiceManagementProcess()
        serviceManagementProcess.properties = params
        return ['serviceManagementProcess': serviceManagementProcess]
    }

    def save = {
        def serviceManagementProcess = new ServiceManagementProcess(params)
        if (!serviceManagementProcess.hasErrors() && serviceManagementProcess.save()) {
            flash.message = "Created: '${serviceManagementProcess.name}'"
            redirect(action: list)
        }
        else {
            render(view: 'create', model: [serviceManagementProcess: serviceManagementProcess])
        }
    }

    def search = {
       def results = []
        def queryparams = [:]
        if (params.category) queryparams['category'] = params.category
        results = ServiceManagementProcess.findAllWhere(queryparams)
        render(view:'search',model:[serviceManagementProcessList:results])
    }

    def createScorecard = {
        // nothing to do
    }

    def listScorecards = {

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
        render(view: 'listScorecards', model: [scorecardParams: params, processScorecardMap: results])
    }
}
