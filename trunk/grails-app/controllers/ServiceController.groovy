class ServiceController extends SecureController {

    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [serviceList: Service.list(params)]
    }

    def show = {
        def service = Service.get(params.id.toLong())

        if (!service) {
            flash.message = "Service not found with id ${params.id}"
            redirect(action: list)
        }
        else {return [service: service]}
    }
    def xmlReceipts ={
        return show.call(params)
    }
    def ajaxProcessSelect ={
        render(template:"processSelect",model:params.id?show(params):[processes:[]])
    }

    def delete = {
        def service = Service.get(params.id)
        def sname = service.name
        if (service) {
            def processes = ServiceManagementProcess.findAllByService(service)
            processes.each {process ->
                def pname = process.name
                process.delete()
                log.info("Deleted process ${pname}")
            }
            if (service.delete()) {
                log.info("Deleted service: ${sname}")
                flash.message = "Deleted: '${sname}'"
                redirect(action: list)
            } else {
                flash.message = "Cannot delete. There are referring objects"
                redirect(action: show, id: params.id)
            }
        } else {
            flash.message = "Service not found with id: ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def service = Service.get(params.id)

        if (!service) {
            flash.message = "Cannot edit. Service not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [service: service]
        }
    }
    def editGoals = {
        def service = Service.get(params.id)

        if (!service) {
            flash.message = "Cannot edit. Service not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [service: service]
        }
    }

    def update = {
        def service = Service.get(params.id)
        if (service) {
            service.properties = params
            if(params.goals && params.goals.id || params.newGoals){
                def ServiceScorecardGoals goals
                if(service.goals){
                    goals = service.goals
                    goals.properties=params.goals
                }else{
                    goals = new ServiceScorecardGoals(params.goals)
                }
                println("saving goals: ${service.goals}")
                if(service.goals.hasErrors() || !service.goals.save()){
                    render(view: 'editGoals', model: [service: service])
                    return
                }
            }
            if (!service.hasErrors() && service.save()) {
                flash.message = "Updated: ${service.name}"
                if(params.goals && params.goals.id || params.newGoals){
                    redirect(action: show,id: params.id)
                }else{
                    redirect(action: list)
                }
            }
            else {
                render(view: 'edit', model: [service: service])
            }
        }
        else {
            flash.message = "Service not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        if (ResourceType.count() > 0) {
            def service = new Service()
            service.properties = params
            return ['service': service]
        } else {
            flash.message = "Define a service type"
            redirect(action: 'create', controller: 'resourceType')
        }

    }

    def save = {
        def service = new Service(params)
        service.setCreateDate(new Date())
        if (!service.hasErrors() && service.save()) {
            flash.message = "Created: '${service.name}'"
            render(view: 'show', model: [service: service])
        } else {
            render(view: 'create', model: [service: service])
        }
    }

    def addServiceSelection = {
        println("DEBUG: params=${params}")
        def service
        if (params.name) {
            service = Service.findByName(params.name)
        } else {
            service = new Service(params)
            service.setCreateDate(new Date())
            if (service.hasErrors || !service.save()) {
                render(view: 'create', model: [service: service])
            }
        }

        render {
            option(value: service.id, "${service.name}")
        }
    }

    def peopleCoverage = {
        def service = Service.get(params.id)

        if (!service) {
            flash.message = "Service not found with id ${params.id}"
            redirect(action: list)
        }

        return [service: service]
       
    }
}
