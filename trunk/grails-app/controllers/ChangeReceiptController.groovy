class ChangeReceiptController extends SecureController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ changeReceiptList: ChangeReceipt.list( params ) ]
    }

    def show = {
        def changeReceipt = ChangeReceipt.get( params.id )

        if(!changeReceipt) {
            flash.message = "ChangeReceipt not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ changeReceipt : changeReceipt ] }
    }

    def delete = {
        def changeReceipt = ChangeReceipt.get( params.id )
        if(changeReceipt) {
            changeReceipt.delete()
            flash.message = "ChangeReceipt ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ChangeReceipt not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def changeReceipt = ChangeReceipt.get( params.id )

        if(!changeReceipt) {
            flash.message = "ChangeReceipt not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ changeReceipt : changeReceipt ]
        }
    }

    def update = {
        def changeReceipt = ChangeReceipt.get( params.id )
        if(changeReceipt) {
            changeReceipt.properties = params
            if(!changeReceipt.hasErrors() && changeReceipt.save()) {
                flash.message = "ChangeReceipt ${params.id} updated"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[changeReceipt:changeReceipt])
            }
        }
        else {
            flash.message = "ChangeReceipt not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def changeReceipt = new ChangeReceipt()
        changeReceipt.properties = params
        return ['changeReceipt':changeReceipt]
    }

    def save = {
        def changeReceipt = new ChangeReceipt(params)
        if(!changeReceipt.hasErrors() && changeReceipt.save()) {
            flash.message = "ChangeReceipt ${changeReceipt.id} created"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[changeReceipt:changeReceipt])
        }
    }
}
