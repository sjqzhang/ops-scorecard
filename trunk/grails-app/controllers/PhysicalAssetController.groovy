class PhysicalAssetController extends SecureController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ physicalAssetList: PhysicalAsset.list( params ) ]
    }

    def show = {
        def physicalAsset = PhysicalAsset.get( params.id )

        if(!physicalAsset) {
            flash.message = "PhysicalAsset not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ physicalAsset : physicalAsset ] }
    }

    def delete = {
        def physicalAsset = PhysicalAsset.get( params.id )
        if(physicalAsset) {
            physicalAsset.delete()
            flash.message = "Deleted: '${params.name}'"
            redirect(action:list)
        }
        else {
            flash.message = "PhysicalAsset not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def physicalAsset = PhysicalAsset.get( params.id )

        if(!physicalAsset) {
            flash.message = "PhysicalAsset not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ physicalAsset : physicalAsset ]
        }
    }

    def update = {
        def physicalAsset = PhysicalAsset.get( params.id )
        if(physicalAsset) {
            physicalAsset.properties = params
            if(!physicalAsset.hasErrors() && physicalAsset.save()) {
                flash.message = "Updated: '${params.name}'"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[physicalAsset:physicalAsset])
            }
        }
        else {
            flash.message = "PhysicalAsset not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def physicalAsset = new PhysicalAsset()
        physicalAsset.properties = params
        return ['physicalAsset':physicalAsset]
    }

    def save = {
        def physicalAsset = new PhysicalAsset(params)
        physicalAsset.setCreateDate(new Date())
        if(!physicalAsset.hasErrors() && physicalAsset.save()) {
            flash.message = "Created: '${physicalAsset.name}'"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[physicalAsset:physicalAsset])
        }
    }
}
