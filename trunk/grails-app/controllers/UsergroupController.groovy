class UsergroupController extends SecureController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ usergroupList: Usergroup.list( params ) ]
    }

    def show = {
        def usergroup = Usergroup.get( params.id )

        if(!usergroup) {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ usergroup : usergroup ] }
    }

    def delete = {
        def usergroup = Usergroup.get( params.id )
        if(usergroup) {
            usergroup.delete()
            flash.message = "Deleted ${params.name}"
            redirect(action:list)
        }
        else {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def usergroup = Usergroup.get( params.id )

        if(!usergroup) {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ usergroup : usergroup ]
        }
    }

    def update = {
        def usergroup = Usergroup.get( params.id )
        if(usergroup) {
            usergroup.properties = params
            if(!usergroup.hasErrors() && usergroup.save()) {
                flash.message = "Updated ${params.name}"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[usergroup:usergroup])
            }
        }
        else {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def usergroup = new Usergroup()
        usergroup.properties = params
        return ['usergroup':usergroup]
    }

    def save = {
        def usergroup = new Usergroup(params)
        if(!usergroup.hasErrors() && usergroup.save()) {
            flash.message = "Created ${usergroup.name} "
            redirect(action:list)
        }
        else {
            render(view:'create',model:[usergroup:usergroup])
        }
    }
}
