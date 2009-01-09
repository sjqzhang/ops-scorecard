class ServiceScorecardController extends SecureController{
    ServiceScorecardService serviceScorecardService
    def index = { redirect(action:table,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ serviceScorecardInstanceList: ServiceScorecard.list( params ) ]
    }
    def clear={
        if(grails.util.GrailsUtil.environment=="development"){
            ServiceScorecard.list().each{
                it.delete()
            }
        }
        redirect(action:list)
    }

    def table = {
        //show table of services with the latest scorecard for each one
        def services

        def sorts=[sort:'goalsMetPct',order:'desc',offset:0,max:40]
        sorts.putAll(params.subMap(['sort','order','offset','max']))
        def options=[:]
        def Map sscorecard_services=[:]
        //get view options and service selections
        if(params['customView']){
            options=params['show']
            session.sscorecard_options=options
            params['service'].keySet().each{
                if(params['service'][it] && it.isNumber()){
                    println("saw it: ${it}")
                    sscorecard_services[it]=true
                }
            }
            session.sscorecard_services=sscorecard_services
        }else{
            sscorecard_services=session.sscorecard_services?session.sscorecard_services:[:]
        }
        if(!sscorecard_services){
            services = Service.list(order:'asc',sort:'name')
        }else{
            services=Service.findAll("from Service as s where s.id in (:ids)", ['ids':sscorecard_services.keySet().collect{it.toLong()}],['order':'asc','sort':'name'])
        }

        //determine date range for previous week.

        //get current calendar for now, set time to midnight
        long currenttime=System.currentTimeMillis()
        long reftime=currenttime
        if(params.datetime){
            reftime = params.datetime.toLong()
        }
        def dates = serviceScorecardService.determinePreviousWeekForDatetime(reftime)
        Date date = dates.start
        Date date2 = dates.end
        Calendar startCal = new GregorianCalendar()
        startCal.setTime(date)
        Calendar endCal = new GregorianCalendar()
        endCal.setTime(date2)
        Date prevDate = new Date(reftime-(7*24*60*60*1000 /*one week*/))
        Date nextDate = new Date(reftime+(7*24*60*60*1000 /*one week*/))
        println("determined date: ${date}, ${date2}, or, ${prevDate}")


        def cards = ServiceScorecard.findAllByEndDate(date2,sorts)
        def results=[]
        def bestCounts=[:]
        def worstCounts=[:]
        def seenservices=[:]
        def newcards=[]
        cards.each{ card ->
            if(!seenservices[card.service.id]){
                seenservices[card.service.id]=card
            }else if (seenservices[card.service.id].dateCreated < card.dateCreated){
                seenservices[card.service.id]=card
            }
        }
        cards.each{ card->
            if(seenservices[card.service.id]==card){
                newcards<<card
                println("selected card ${card.id}")
            }
        }
        newcards.each{ card->
            if(!sscorecard_services || sscorecard_services[card.service.id.toString()]){
                results<<card
                services.remove(card.service)

                ServiceScorecardBase.metricsList.each{
                    def dir = ServiceScorecardBase.metricsPositivity[it]
                    if(null==dir){
                        dir=-1
                    }
                    
                    def val=card[it]
                    if( (dir>0 && (null==bestCounts[it] || val > bestCounts[it]))
                        || (dir < 0 && (null==bestCounts[it] || val < bestCounts[it]))){
                        //check if the metric is audit-based and whether the scorecard should be counted
                        if(!ServiceScorecardBase.auditMetrics.contains(it) || card.auditsExist){
                            bestCounts[it]=val
                        }
                    }
                    if( (dir>0 && (null==worstCounts[it] || val < worstCounts[it]))
                        || (dir < 0 && (null==worstCounts[it] || val > worstCounts[it]))){
                        //check if the metric is audit-based and whether the scorecard should be counted
                        if(!ServiceScorecardBase.auditMetrics.contains(it) || card.auditsExist){
                            worstCounts[it]=val
                        }
                    }
                }
            }
        }
        
        [services:services,serviceScorecardInstanceList:results,bestMap:bestCounts,worstMap:worstCounts,
                startCal:startCal, endCal:endCal, prevDate:prevDate,nextDate:nextDate.getTime()<currenttime?nextDate:null]
    }

    def show = {
        def serviceScorecardInstance = ServiceScorecard.get( params.id )

        if(!serviceScorecardInstance) {
            flash.message = "ServiceScorecard not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            
            def receipts = ProcessReceipt.withCriteria
            {
                and{
                    between('date', serviceScorecardInstance.startDate, serviceScorecardInstance.endDate)
                    process{
                        service {
                            eq('id',serviceScorecardInstance.service.id)
                        }
                    }
                }
            }
            def scorecards = ServiceScorecard.withCriteria{
                service{
                    eq('id',serviceScorecardInstance.service.id)
                }
                lt('startDate',serviceScorecardInstance.startDate)
                order('startDate', 'desc')
            }
            return [ serviceScorecardInstance : serviceScorecardInstance , receipts:receipts, previousscores:scorecards]
        }
    }

    def delete = {
        def serviceScorecardInstance = ServiceScorecard.get( params.id )
        if(serviceScorecardInstance) {
            serviceScorecardInstance.delete()
            flash.message = "ServiceScorecard ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ServiceScorecard not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def serviceScorecardInstance = ServiceScorecard.get( params.id )

        if(!serviceScorecardInstance) {
            flash.message = "ServiceScorecard not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ serviceScorecardInstance : serviceScorecardInstance ]
        }
    }

    def update = {
        def serviceScorecardInstance = ServiceScorecard.get( params.id )
        if(serviceScorecardInstance) {
            serviceScorecardInstance.properties = params
            if(!serviceScorecardInstance.hasErrors() && serviceScorecardInstance.save()) {
                flash.message = "ServiceScorecard ${params.id} updated"
                redirect(action:show,id:serviceScorecardInstance.id)
            }
            else {
                render(view:'edit',model:[serviceScorecardInstance:serviceScorecardInstance])
            }
        }
        else {
            flash.message = "ServiceScorecard not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def serviceScorecardInstance = new ServiceScorecard()
        serviceScorecardInstance.properties = params
        return ['serviceScorecardInstance':serviceScorecardInstance]
    }
    def generate={
        serviceScorecardService.generatePreviousWeekScorecards(params.datetime?params.datetime.toLong():System.currentTimeMillis())
        redirect(action:table)
    }

    def save = {
        def serviceScorecardInstance = new ServiceScorecard(params)
        if(null!=serviceScorecardInstance.goals){
            if(!serviceScorecardInstance.goals.save()){
                flash.message = "Goals errors"
                render(view:'create',model:[serviceScorecardInstance:serviceScorecardInstance])
            }
        }

        if(!serviceScorecardInstance.hasErrors() && serviceScorecardInstance.save()) {
            flash.message = "ServiceScorecard ${serviceScorecardInstance.id} created"
            redirect(action:show,id:serviceScorecardInstance.id)
        }
        else {
            render(view:'create',model:[serviceScorecardInstance:serviceScorecardInstance])
        }
    }
    
}
