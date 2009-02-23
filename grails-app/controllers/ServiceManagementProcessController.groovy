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
        def serviceManagementProcess = ServiceManagementProcess.get(params.id.toInteger())

        if (!serviceManagementProcess) {
            flash.message = "ServiceManagementProcess not found with id ${params.id}"
            redirect(action: list)
        }
        else {return [serviceManagementProcess: serviceManagementProcess]}
    }

    def txtAudit = {
        return show.call(params)
    }

    def delete = {
        def serviceManagementProcess = ServiceManagementProcess.get(params.id)
        def matches = ServiceManagementProcessScorecard.findByProcess(serviceManagementProcess)
        matches.each {
            it.delete()
        }
        if (serviceManagementProcess) {
            def service = serviceManagementProcess.service
            serviceManagementProcess.delete()
            flash.message = "Deleted: '${serviceManagementProcess.category}' process"
            redirect(controller:"service", action:"show", id:service.id)
        }
        else {
            flash.message = "ServiceManagementProcess not found with id ${params.id}"
            redirect(controller:"service", action: "list")
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
                flash.message = "Updated: ${serviceManagementProcess.category} process"
                redirect(controller:"service", action:"show", id:serviceManagementProcess.service.id)
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
        serviceManagementProcess.setCreateDate(new Date())
        if (!serviceManagementProcess.hasErrors() && serviceManagementProcess.save()) {
            flash.message = "Created: '${serviceManagementProcess.name}'"
            redirect(controller:"service", action:"show", id:serviceManagementProcess.service.id)

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
 
}
