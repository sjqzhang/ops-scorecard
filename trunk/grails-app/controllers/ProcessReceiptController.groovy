class ProcessReceiptController extends SecureController {
    
    def index = {  }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ processReceiptList: ProcessReceipt.list( params ) ]
    }

    def show = {
        def processReceipt = ProcessReceipt.get( params.id )

        if(!processReceipt) {
            flash.message = "ProcessReceipt not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ processReceipt : processReceipt ] }
    }

    def delete = {
        def processReceipt = ProcessReceipt.get( params.id )
        if(processReceipt) {
            processReceipt.delete()
            flash.message = "ProcessReceipt ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ProcessReceipt not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def processReceipt = ProcessReceipt.get( params.id )

        if(!processReceipt) {
            flash.message = "ProcessReceipt not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ processReceipt : processReceipt ]
        }
    }

    def update = {
        def processReceipt = ProcessReceipt.get( params.id )
        if(processReceipt) {
            processReceipt.properties = params
            if(!processReceipt.hasErrors() && processReceipt.save()) {
                flash.message = "ProcessReceipt ${params.id} updated"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[processReceipt:processReceipt])
            }
        }
        else {
            flash.message = "ProcessReceipt not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def processReceipt = new ProcessReceipt()
        processReceipt.properties = params
        return ['processReceipt':processReceipt]
    }

    def save = {
        def processReceipt = new ProcessReceipt(params)
        if(!processReceipt.hasErrors() && processReceipt.save()) {
            flash.message = "ProcessReceipt ${processReceipt.id} created"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[processReceipt:processReceipt])
        }
    }

     def search = {
       println("DEBUG: params=${params}")
         def matches = []
        if (params.service && Service.exists(params.service)) {
            matches = ProcessReceipt.findAllByService(Service.get(params.service))
        }
        render(view:'list', model:[ processReceiptList:matches ])
    }
}
