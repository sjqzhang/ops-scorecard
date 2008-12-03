class ResourceTypeController extends SecureController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ resourceTypeList: ResourceType.list( params ) ]
    }

    def show = {
        def resourceType = ResourceType.get( params.id )

        if(!resourceType) {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ resourceType : resourceType ] }
    }

    def delete = {
        def resourceType = ResourceType.get( params.id )
        def name = resourceType.name
        if(resourceType) {
            resourceType.delete()
            flash.message = "Deleted: '${name}'"
            redirect(action:list)
        }
        else {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def resourceType = ResourceType.get( params.id )

        if(!resourceType) {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ resourceType : resourceType ]
        }
    }

    def update = {
        def resourceType = ResourceType.get( params.id )
        if(resourceType) {
            resourceType.properties = params
            if(!resourceType.hasErrors() && resourceType.save()) {
                flash.message = "Updated: '${params.name}'"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[resourceType:resourceType])
            }
        }
        else {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def resourceType = new ResourceType()
        resourceType.properties = params
        return ['resourceType':resourceType]
    }

    def save = {
        def resourceType = new ResourceType(params)
        if(!resourceType.hasErrors() && resourceType.save()) {
            flash.message = "Created: '${resourceType.name}'"
            redirect(action:show,id:resourceType.id)
        }
        else {
            render(view:'create',model:[resourceType:resourceType])
        }
    }


    // basically the same as the save closure property except it returns a simple view
    // and is filtered by the specified metatype
    def addType = {
        println("DEBUG: ResourceTypeController#save: params=${params}")

        def resourceType = new ResourceType(params)
        if(!resourceType.hasErrors() && resourceType.save()) {
            flash.message = "Created: '${resourceType.name}'"
        }
        render(template:"resourceType",
                var:"resourceType",
                collection:ResourceType.findAllByMetatype(params.metatype))
    }

}
