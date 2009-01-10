class ServiceScorecardService {

    boolean transactional = true

    /**
     * Generate the service scorecards for the week prior to the given datetime
     */
    def generatePreviousWeekScorecards(long reftime) {
        def dates = determinePreviousWeekForDatetime(reftime)
        return generateScorecardsForDates(dates.start, dates.end)
    }

    def Map determinePreviousWeekForDatetime(long reftime) {
        Calendar curcal = new GregorianCalendar()
        curcal.setTimeInMillis(reftime)

        curcal.set(Calendar.HOUR_OF_DAY, 0)
        curcal.set(Calendar.MINUTE, 0)
        curcal.set(Calendar.SECOND, 0)
        curcal.set(Calendar.MILLISECOND, 0)

        //set to previous week of the year
        curcal.add(Calendar.WEEK_OF_YEAR, -1)
        curcal.set(Calendar.DAY_OF_WEEK, curcal.getFirstDayOfWeek())

        //create another calendar, copy the date, and move forward one week (to beginning of current week)
        //and subtract 1 second
        Calendar curcal2 = new GregorianCalendar()
        curcal2.setTime(curcal.getTime())
        curcal2.add(Calendar.WEEK_OF_YEAR, 1)

        Date startdate = curcal.getTime()
        Date enddate = curcal2.getTime()
        [start: startdate, end: enddate]
    }

    boolean checkGoalSet(goal, name) {
        if (name == "goalsMetPct") {
            return false
        }
        def dir = ServiceScorecardBase.metricsPositivity[name]
        if (null == dir) {
            dir = -1
        }
        if (dir > 0 && goal > 0) {
            return true
        } else if (dir < 0) {
            return true
        }
        return false
    }

    boolean checkGoal(value, goal, name) {
        def dir = ServiceScorecardBase.metricsPositivity[name]
        if (null == dir) {
            dir = -1
        }
        if (dir > 0 && value >= goal) {
            return true
        } else if (dir < 0 && value <= goal) {
            return true
        } else {
            return false
        }

    }

    /**
     * float processCoveragePct - number of processes implemented divided by total (number of categories)
     */
    def float genProcessCoverage(Service service) {
        def pcovtotal = ServiceManagementProcess.processCategories.size()
        //iterate through processes for the service and collate number of categories covered
        def pcovset = new HashSet()
        pcovset.addAll(ServiceManagementProcess.findAllByService(service).collect {it.category})
        def pcovsum = pcovset.size()
        println("processCoveragePct= 100f*${pcovsum} / ${pcovtotal}: (Set: ${pcovset})")
        def result = 0f
        if (pcovtotal > 0) {
            result = 100f * pcovsum / pcovtotal
            println("processCoveragePct= ${result} ")
        }
        return result
    }

    def Map setGoalsMetPct(ServiceScorecard card) {
        if (null == card.goals) {
            return
        }
        def goalsMetTotal = 0f
        def goalsSetTotal = 0f
        ServiceScorecardBase.metricsList.each {metric ->
            if (checkGoalSet(card.goals[metric], metric)) {
                goalsSetTotal++
                if (!ServiceScorecardBase.auditMetrics.contains(metric) || card.auditsExist) {
                    if (checkGoal(card[metric], card.goals[metric], metric)) {
                        goalsMetTotal++
                    }
                }
            }
        }
        if (goalsSetTotal > 0) {
            card.goalsMetPct = 100f * (goalsMetTotal / goalsSetTotal)
        } else {
            card.goalsMetPct = 0f
        }
    }

    def genProcessQuality(Service service, Date startdate, Date enddate) {
        def pqualitytotal = 0
        def pqualitytcount = 0
        def foundaudits = false
        CapabilityAudit.findAllByServiceAndAuditDateBetween(service, startdate, enddate).each {CapabilityAudit audit ->
            foundaudits = true
            audit.scorecards.each {ServiceManagementProcessScorecard scorecard ->
                pqualitytotal += scorecard.consistency.calculateScore()
                pqualitytotal += scorecard.effectiveness.calculateScore()
                pqualitytotal += scorecard.reliability.calculateScore()
                pqualitytotal += scorecard.safety.calculateScore()
                pqualitytotal += scorecard.success.calculateScore()
                pqualitytcount += 5
            }
        }
        def processQualityPct = 0f
        if (pqualitytcount > 0) {
            //in this case, each score is percentage number (0-100) so we don't have to multiply by 100
            processQualityPct = (pqualitytotal / pqualitytcount)
        }
        [foundaudits: foundaudits, processQualityPct: processQualityPct]
    }

    def genAvailabilityScores(Service service, Date startdate, Date enddate) {

        /* float serviceAvailabilityPct - percentage of time that service was available (from availability receipts) */
        //find availability receipts and calculate total availability percentage for the week
        def availreceipts = AvailabilityReceipt.withCriteria {
            or{
                and {
                    ge('endDate', startdate)
                    le('endDate', enddate)
                }
                and {
                    ge('startDate', startdate)
                    le('startDate', enddate)
                }
            }
            delegate.'service' {
                eq('id', service.id)
            }
            order('startDate', 'desc')
        }


        //assume available time was 100% for entries not in availability receipts
        def long totalscoretime = enddate.getTime() - startdate.getTime()
        def long totalavailtime = totalscoretime
        println("availreceipts: ${availreceipts}, dates: ${startdate}, ${enddate}, totalscoretime: ${totalscoretime}")
        //for MTTR, retain duration total and number of receipts
        def long totalAvailDuration = 0
        def int totalAvailReceiptCount = 0

        //for MTBF, retain previous failure start and totals of time between failures
        def long totalAvailBFDuration = 0
        def float totalAvailBFCount = 0
        def long prevFailureStart = 0

        //for summary of service failures counts
        def int serviceFailuresCount = 0
        def int smActivitiesImpactedAvailabilityCount = 0

        availreceipts.each {AvailabilityReceipt receipt ->
            Date start = receipt.startDate
            Date end = receipt.endDate

            if (receipt.startDate < startdate) {
                //availability report started before our timeperiod did.  Calculate actual time that was
                //within our timeperiod
                start = startdate
            }
            if (receipt.endDate > enddate) {
                //availability report started before our timeperiod did.  Calculate actual time that was
                //within our timeperiod
                end = enddate
            }
            def long duration = end.getTime() - start.getTime()
            def float perc = receipt.level / 100f
            def float availtime = duration * perc
            totalavailtime -= (duration - availtime)
            println("duration - availtime = ${duration} - ${availtime}, totalavailtime is now ${totalavailtime}")

            if (receipt.level < 100) {
                serviceFailuresCount++
                if (null != receipt.process) {
                    smActivitiesImpactedAvailabilityCount++
                }
                totalAvailDuration += duration
                totalAvailReceiptCount++
                if (prevFailureStart > 0) {
                    totalAvailBFDuration += (prevFailureStart - end.getTime())
                    totalAvailBFCount++
                }
                prevFailureStart = start.getTime()
            }
        }
        //set to percentage

        double availabilityratio = 0f
        println("serviceAvailabilityPct = 100f * (${totalavailtime} / ${totalscoretime})")
        def serviceAvailabilityPct = 0f
        if (totalscoretime > 0) {
            availabilityratio = totalavailtime / totalscoretime
            serviceAvailabilityPct = 100f * (totalavailtime *1.0f / totalscoretime*1.0f)
            println("serviceAvailabilityPct = ${serviceAvailabilityPct}")
        }

        /* float estimatedOutageCost - total time service was unavailable times estimated hourly cost (some way to calculate partial outages?) */
        //multiply availability ratio inverse by outage cost and total number of hours in the timeperiod
        def float totalscorehours = totalscoretime / (1000f * 60f * 60f)
        println("estimatedOutageCost = ((1f - ${availabilityratio}) * (${totalscoretime}/(1000*60*60)) * \$${service.outageCost}")
        def estimatedOutageCost = 0f
        if (availabilityratio > 0) {
            estimatedOutageCost = (((totalscoretime -totalavailtime )/ totalscoretime) * totalscorehours) * service.outageCost
            println("estimatedOutageCost = ${estimatedOutageCost}")
        }

        /* float MTTRTime - mean amount of time it takes to restore service availability (from availability receipts) */
        //calculate average of availability receipt durations, in hours

        def MTTRTime = 0f
        if (totalAvailReceiptCount > 0) {
            MTTRTime = (totalAvailDuration / totalAvailReceiptCount) / (1000f * 60f * 60f)
        }
        println("MTTR = (${totalAvailDuration}/${totalAvailReceiptCount}) / (1000*60*60)")
        println("MTTR = ${MTTRTime}")

        /* float MTBFTime - Mean time between service events where service has availability issues (from availability receipts) */
        //calculate average of durations in between availability receipts, in hours

        def MTBFTime = 0f
        if (totalAvailBFCount > 0) {
            MTBFTime = (totalAvailBFDuration / totalAvailBFCount) / (1000f * 60f * 60f)
        }
        println("MTBF= (${totalAvailBFDuration}/${totalAvailBFCount}) / (1000*60*60)")
        println("MTBF= ${MTBFTime}")

        /* int serviceFailuresCount */
        println("serviceFailuresCount= ${serviceFailuresCount}")
        [serviceFailuresCount: serviceFailuresCount,
                MTBFTime: MTBFTime, 
                MTTRTime: MTTRTime,
                estimatedOutageCost: estimatedOutageCost,
                serviceAvailabilityPct: serviceAvailabilityPct,
                smActivitiesImpactedAvailabilityCount: smActivitiesImpactedAvailabilityCount]
    }

    def genProcessReceiptScores(Service service, Date startdate, Date enddate){

        /* int smActivitiesCount - Total number of service management activities (from process receipts) */
        //add up number of process receipts for the service within the time period
        def processreceipts = ProcessReceipt.withCriteria {
            and {
                between('date', startdate, enddate)
                delegate.process {
                    delegate.service {
                        eq('id', service.id)
                    }
                }
            }
        }


        def int smActivitiesCount = processreceipts.size()
        println("smActivitiesCount=${smActivitiesCount}")

        /* float highImpactActivityPct - percentage of service management activities that were marked high impact
         * (from process receipts)
         */


        /* float smSuccessPct Percentage of all service management activities that completed with a successful
        * status(from process receipts)
        */
        /* int smActivitiesUnplannedCount
         * Service management activities that didn't go through proper planning and scheduling process (from process receipts)
         */
        def int highImpactCount = 0
        def int adHocCount = 0
        def int deviationCount = 0
        def int successCount = 0
        def int smActivityImpactCount = 0
        def int smActivitiesUnplannedCount = 0

        processreceipts.each {ProcessReceipt preceipt ->
            if (preceipt.impactLevel == 'high') {
                highImpactCount++
            }
            if (preceipt.outcome == 'successful') {
                successCount++
            }
            if (preceipt.status != 'planned') {
                smActivitiesUnplannedCount++
            }
        }
        println("highImpactActivityPct = 100f*(${highImpactCount}/${smActivitiesCount}) ")
        println("smSuccessPct = 100f*(${successCount} / ${smActivitiesCount})")
        def highImpactActivityPct=0f
        def smSuccessPct=0f
        if (smActivitiesCount > 0) {
            highImpactActivityPct = 100f * (highImpactCount / smActivitiesCount)
            smSuccessPct = 100f * (successCount / smActivitiesCount)
            println("highImpactActivityPct = ${highImpactActivityPct}")
            println("smSuccessPct = ${smSuccessPct}")
        }
        println("smActivitiesUnplannedCount = ${smActivitiesUnplannedCount}")

        [smActivitiesCount:smActivitiesCount,smActivitiesUnplannedCount:smActivitiesUnplannedCount,
                highImpactActivityPct:highImpactActivityPct,smSuccessPct:smSuccessPct]
    }


    /**
     *  Generate service scorecards for the given date period
     */
    def generateScorecardsForDates(Date startdate, Date enddate) {
        def calculations = []



        def services = Service.list()
        services.each {Service service ->
            println("genearte for service: ${service}")
            //generate for each service
            ServiceScorecard score = new ServiceScorecard()
            score.service = service
            score.startDate = startdate
            score.endDate = enddate

            //for each metric determine the value.

            //TODO: retrieve a goal set for use with the scorecard if it exists

            if(service.goals){
                ServiceScorecardGoals goals = new ServiceScorecardGoals()
                goals.properties = service.goals.properties
                score.goals=goals
            }
            
            /* float goalsMetPct  - keep tally of goals met, and calculate at end. */
            def goalsMetTotal = 0

            /* float risk  - calculation: TBD */
            //TODO: calculate risk

            /* float smControlsPct - calculation: ? */
            //TODO: calculate smControlsPct

            /* float processCoveragePct - number of processes implemented divided by total (number of categories) */

            score.processCoveragePct = genProcessCoverage(service)

            /* float processQualityPct - average of the quality measurements across all process for service (consistency, effectiveness, reliability, safety, success) */

            //iterate over audits, and over each ones process scorecards. average the total ratings for each quality category
            def pqualityresults = genProcessQuality(service, score.startDate, score.endDate)
            score.processQualityPct = pqualityresults.processQualityPct

            /* boolean auditsExist - set to true if any audits for the time period are found */
            score.auditsExist = pqualityresults.foundaudits


            //calculate results from AvailabilityReceipts
            def availresults = genAvailabilityScores(service, score.startDate, score.endDate)

            /* float serviceAvailabilityPct - percentage of time that service was available (from availability receipts) */
            score.serviceAvailabilityPct=availresults.serviceAvailabilityPct

            /* float estimatedOutageCost - total time service was unavailable times estimated hourly cost (some way to calculate partial outages?) */

            score.estimatedOutageCost = availresults.estimatedOutageCost

            /* float MTTRTime - mean amount of time it takes to restore service availability (from availability receipts) */

            score.MTTRTime = availresults.MTTRTime

            /* float MTBFTime - Mean time between service events where service has availability issues (from availability receipts) */

            score.MTBFTime = availresults.MTBFTime

            /* int serviceFailuresCount */
            score.serviceFailuresCount = availresults.serviceFailuresCount

            /* int smActivitiesImpactedAvailabilityCount
            * Service management activities that had an impact on service availability (from process receipts only or
            * from both process and availability receipts?)
            */
            score.smActivitiesImpactedAvailabilityCount = availresults.smActivitiesImpactedAvailabilityCount


            def procresults = genProcessReceiptScores(service,score.startDate,score.endDate)
            /* int smActivitiesCount - Total number of service management activities (from process receipts) */
            score.smActivitiesCount=procresults.smActivitiesCount

            /* float highImpactActivityPct - percentage of service management activities that were marked high impact
             * (from process receipts)
             */
            score.highImpactActivityPct = procresults.highImpactActivityPct

            /* int adHocActivityCount -Service management activities for which a process receipt was submitted but it
             * didn't follow a predefined process (from process receipts)
             * TODO: calculate adHocActivityCount
             */
            
            /* int processDeviationsCount
             * Service management activities that started with a
             * defined process but deviated from that process during execution (from process receipts)
             * TODO: calculate processDeviationsCount
             */


            /* float smSuccessPct Percentage of all service management activities that completed with a successful
            * status(from process receipts)
            */
            score.smSuccessPct=procresults.smSuccessPct

            /* int smActivitiesUnplannedCount
             * Service management activities that didn't go through proper planning and scheduling process (from process receipts)
             */
            score.smActivitiesUnplannedCount=procresults.smActivitiesUnplannedCount


            /* int smActivitiesUnapprovedCount
            * Service management activities that didn't go through the proper review and approval process
            * TODO: calculate smActivitiesUnapprovedCount
            */


            setGoalsMetPct(score)

            if(score.goals){
                score.goals.save()
            }
            score.save()
            calculations << score
        }
        return calculations
    }
}
