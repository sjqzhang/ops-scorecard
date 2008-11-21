class ReleaseArtifactController  extends SecureController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ releaseArtifactList: ReleaseArtifact.list( params ) ]
    }

    def show = {
        def releaseArtifact = ReleaseArtifact.get( params.id )

        if(!releaseArtifact) {
            flash.message = "ReleaseArtifact not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ releaseArtifact : releaseArtifact ] }
    }

    def delete = {
        def releaseArtifact = ReleaseArtifact.get( params.id )
        if(releaseArtifact) {
            releaseArtifact.delete()
            flash.message = "Deleted: '${params.name}'"
            redirect(action:list)
        }
        else {
            flash.message = "ReleaseArtifact not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def releaseArtifact = ReleaseArtifact.get( params.id )

        if(!releaseArtifact) {
            flash.message = "ReleaseArtifact not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ releaseArtifact : releaseArtifact ]
        }
    }

    def update = {
        def releaseArtifact = ReleaseArtifact.get( params.id )
        if(releaseArtifact) {
            releaseArtifact.properties = params
            if(!releaseArtifact.hasErrors() && releaseArtifact.save()) {
                flash.message = "Updated: '${params.name}'"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[releaseArtifact:releaseArtifact])
            }
        }
        else {
            flash.message = "ReleaseArtifact not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def releaseArtifact = new ReleaseArtifact()
        releaseArtifact.properties = params
        return ['releaseArtifact':releaseArtifact]
    }

    def save = {
        def releaseArtifact = new ReleaseArtifact(params)
        if(!releaseArtifact.hasErrors() && releaseArtifact.save()) {
            flash.message = "Created: '${releaseArtifact.name}'"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[releaseArtifact:releaseArtifact])
        }
    }

    def search = {
        def results = []
         def queryparams = [:]
         if (params.category) queryparams['type'] = params.category
         results = ReleaseArtifact.findAllWhere(queryparams)
         render(view:'search',model:[releaseArtifactList:results])
     }

}
