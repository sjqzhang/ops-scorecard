class CapabilityAuditController extends SecureController {

    ScorecardService scorecardService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ capabilityAuditList: CapabilityAudit.list( params ) ]
    }

    def show = {
        def capabilityAudit = CapabilityAudit.get( params.id )

        if(!capabilityAudit) {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action:list)
        }  else {
            return [ capabilityAudit : capabilityAudit , scores : capabilityAudit.calculateScores() ]
        }
    }

    def delete = {
        def capabilityAudit = CapabilityAudit.get( params.id )
        if(capabilityAudit) {
            capabilityAudit.delete()
            flash.message = "CapabilityAudit ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def capabilityAudit = CapabilityAudit.get( params.id )

        if(!capabilityAudit) {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ capabilityAudit : capabilityAudit ]
        }
    }

    def update = {
        def capabilityAudit = CapabilityAudit.get( params.id )
        if(capabilityAudit) {
            capabilityAudit.properties = params
            if(!capabilityAudit.hasErrors() && capabilityAudit.save()) {
                flash.message = "CapabilityAudit ${params.id} updated"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[capabilityAudit:capabilityAudit])
            }
        }
        else {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def capabilityAudit = new CapabilityAudit()
        capabilityAudit.properties = params
        return ['capabilityAudit':capabilityAudit]
    }

    def save = {
        def capabilityAudit = new CapabilityAudit(params)
        if(!capabilityAudit.hasErrors() && capabilityAudit.save()) {
            flash.message = "CapabilityAudit ${capabilityAudit.id} created"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[capabilityAudit:capabilityAudit])
        }
    }

    def createScorecard = {

    }

    def summaryScorecard = {
       def scparams = new ScorecardParams(startDate:new Date()-10, endDate:new Date(), service:null)
        def results = scorecardService.listAuditScorecards(scparams)
        render(view:'listAuditScorecards', model:[scorecardParams:scparams,capabilityScoreCardList:results])
    }

    def listAuditScorecards = { ScorecardParams scparams ->
        def results = scorecardService.listAuditScorecards(scparams)
        render(view:'listAuditScorecards', model:[scorecardParams:scparams,capabilityScoreCardList:results])
    }
}

class ScorecardParams {
    Date startDate
    Date endDate
    Service service

    String toString() {
        return "ScorecardParams{startDate=${startDate},endDate=${endDate},service=${service?.id}}"
    }
}

