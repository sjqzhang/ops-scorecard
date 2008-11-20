class CapabilityScoreCardController extends SecureController {
    ScorecardService scorecardService

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ capabilityScoreCardList: CapabilityScoreCard.list( params ) ]
    }

    def show = {
        def capabilityScoreCard = CapabilityScoreCard.get( params.id )

        if(!capabilityScoreCard) {
            flash.message = "CapabilityScoreCard not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ capabilityScoreCard : capabilityScoreCard ] }
    }

    def delete = {
        def capabilityScoreCard = CapabilityScoreCard.get( params.id )
        if(capabilityScoreCard) {
            capabilityScoreCard.delete()
            flash.message = "CapabilityScoreCard ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "CapabilityScoreCard not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def capabilityScoreCard = CapabilityScoreCard.get( params.id )

        if(!capabilityScoreCard) {
            flash.message = "CapabilityScoreCard not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ capabilityScoreCard : capabilityScoreCard ]
        }
    }

    def update = {
        def capabilityScoreCard = CapabilityScoreCard.get( params.id )
        if(capabilityScoreCard) {
            capabilityScoreCard.properties = params
            if(!capabilityScoreCard.hasErrors() && capabilityScoreCard.save()) {
                flash.message = "CapabilityScoreCard ${params.id} updated"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[capabilityScoreCard:capabilityScoreCard])
            }
        }
        else {
            flash.message = "CapabilityScoreCard not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def capabilityScoreCard = new CapabilityScoreCard()
        capabilityScoreCard.properties = params        
        return ['capabilityScoreCard':capabilityScoreCard]
    }

    def save = {
        println("DEBUG: params=${params}")
        def capabilityScoreCard = new CapabilityScoreCard(params)        
        if(!capabilityScoreCard.hasErrors() && capabilityScoreCard.save()) {
            flash.message = "CapabilityScoreCard ${capabilityScoreCard.id} created"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[capabilityScoreCard:capabilityScoreCard])
        }
    }
}
