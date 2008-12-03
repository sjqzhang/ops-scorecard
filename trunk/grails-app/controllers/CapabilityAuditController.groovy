class CapabilityAuditController extends SecureController {

    ScorecardService scorecardService

    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [capabilityAuditList: CapabilityAudit.list(params)]
    }

    def show = {
        def capabilityAudit = CapabilityAudit.get(params.id)

        if (!capabilityAudit) {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action: list)
        } else {
            return [capabilityAudit: capabilityAudit, scores: capabilityAudit.calculateScores()]
        }
    }

    def delete = {
        def capabilityAudit = CapabilityAudit.get(params.id)
        if (capabilityAudit) {
            println("DEBUG: #delete looking up scorecard ...")
            def scorecards = ServiceManagementProcessScorecard.findAllByAudit(capabilityAudit)
            println("DEBUG: #delete: found ${scorecards.size()} scorecards")
            scorecards.each {
                println("DEBUG: #delete: deleting scorecard:${scorecard}")
                it.delete()
            }
            capabilityAudit.delete()
            flash.message = "CapabilityAudit ${params.id} deleted"
            redirect(action: list)
        }
        else {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def capabilityAudit = CapabilityAudit.get(params.id)

        if (!capabilityAudit) {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            def model = [capabilityAudit: capabilityAudit]
            def scorecards = ServiceManagementProcessScorecard.findAllByAudit(capabilityAudit)
            println("Number of scorecards found: ${scorecards.size()}")
            scorecards.each { scorecard ->
                model["scorecards_${scorecard.process.id}"] = scorecard
                println("DEBUG: included scorecard for process: ${scorecard.process.name}")
            }
            return model
        }
    }

    def update = {
        //println("DEBUG: params=${params}")

        def capabilityAudit = CapabilityAudit.get(params.id)

        if (capabilityAudit) {
            capabilityAudit.properties = params
            if (!capabilityAudit.hasErrors() ) {

                // look for keys like: "scorecards_1"
                params.findAll {it.key =~ '^scorecards_\\d$'}.each {
                    def scparms = params[it.key]
                    println("DEBUG: key=${it.key}, scparms=${scparms}")
                    def process = ServiceManagementProcess.get(scparms.process.id)
                    def scorecard = ServiceManagementProcessScorecard.findByAuditAndProcess(capabilityAudit,process)
                    if (!scorecard) {
                        scorecard = new ServiceManagementProcessScorecard(process: process, audit:capabilityAudit)
                        capabilityAudit.addToScorecards(scorecard)
                        println("DEBUG: created a new scorecard")
                    } else {
                        println("DEBUG: found the last scorecard")
                    }
                                                                
                    ServiceManagementProcessScorecard.metrics.each {metric ->
                        if (scparms.containsKey(metric)) {

                            def score = new ServiceManagementProcessScore(scparms[metric])
                            scorecard."${metric}" = score
                            println("DEBUG: added ${score}")
                        }
                    }                                        
                }
                capabilityAudit.save()
                flash.message = "CapabilityAudit ${params.id} updated"
                redirect(action: list)
            } else {
                render(view: 'edit', model: [capabilityAudit: capabilityAudit])
            }
        } else {
            flash.message = "CapabilityAudit not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def capabilityAudit = new CapabilityAudit()
        capabilityAudit.properties = params
        capabilityAudit.scorecards = []
        return ['capabilityAudit': capabilityAudit]
    }

    def save = {
        println("DEBUG: CapabilityAuditController#save: params=${params}")
        def capabilityAudit = new CapabilityAudit(params)
        if (!capabilityAudit.hasErrors() && capabilityAudit.save()) {
            flash.message = "CapabilityAudit ${capabilityAudit.id} created"
            render(view: 'edit', model: [capabilityAudit: capabilityAudit])
        }
        else {
            render(view: 'create', model: [capabilityAudit: capabilityAudit])
        }
    }

    def search = {
        def criteria = CapabilityAudit.createCriteria()
        def results = criteria.list {
            targetedService {
                type {
                    ilike('name', params.targetedServiceType)
                }
            }
        }
        render(view: 'search', model: [capabilityAuditList: results])
    }

}

class CapabilityAuditCommand {
    List scorecards
}