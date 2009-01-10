class ServiceScorecardServiceTests extends GroovyTestCase {
    def serviceScorecardService

    def Service testservice
    def User testuser

    protected void setUp() {
        super.setUp();
        testuser = new User(login: 'test', password: 'test', firstName: 'd', lastName: 'd')
        testuser.save()
        ResourceType estoreType = new ResourceType(name: 'estore', description: 'dev estore', metatype: 'service').save()

        testservice = new Service(name: 'TEST-1', type: estoreType, description: 'TEST estore-1', status: "Installed", isFragile: false,
                createDate: new Date(),
                isMonitored: true, isMissionCritical: false, isRebuildable: true, reprovisioningDuration: "3", outageCost: 100).save()
    }


    void testDeterminePreviousWeekForDatetime() {
        Calendar curcal = new GregorianCalendar(2008, 11, 31, 23, 23, 23)
        Calendar curdupe = new GregorianCalendar()
        curdupe.setTimeInMillis(curcal.getTimeInMillis())
        println("date: ${curcal.getTime()}")

        def results = serviceScorecardService.determinePreviousWeekForDatetime(curcal.getTimeInMillis())
        assertNotNull results
        assertTrue results instanceof Map
        assertEquals 2, results.size()
        assertTrue results.keySet().contains("start")
        assertTrue results.keySet().contains("end")
        assertTrue results['start'] instanceof Date
        assertTrue results['end'] instanceof Date

        Calendar startcal = new GregorianCalendar()
        startcal.setTime(results['start'])
        Calendar endcal = new GregorianCalendar()
        endcal.setTime(results['end'])
        println("results: ${results}")

        assertTrue "date incorrect", results.start.getTime() < curcal.getTimeInMillis()
        assertTrue "date incorrect", results.end.getTime() < curcal.getTimeInMillis()

        int firstday = startcal.getFirstDayOfWeek()
        //int lastday = (firstday - 1) <1?7:(firstday-1)
        assertEquals "incorrect day ${startcal.getTime()}", firstday, startcal.get(Calendar.DAY_OF_WEEK)
        assertEquals "incorrect day ${endcal.getTime()}", firstday, endcal.get(Calendar.DAY_OF_WEEK)

        curdupe.add(Calendar.WEEK_OF_YEAR, -1)
        curdupe.set(Calendar.DAY_OF_WEEK, curdupe.getFirstDayOfWeek())

        assertEquals "incorrect week", curdupe.get(Calendar.WEEK_OF_YEAR), startcal.get(Calendar.WEEK_OF_YEAR)
        assertEquals "incorrect week", curcal.get(Calendar.WEEK_OF_YEAR), endcal.get(Calendar.WEEK_OF_YEAR)


    }

    void testGenerateScorecardsEmpty() {
        def results = serviceScorecardService.generatePreviousWeekScorecards(System.currentTimeMillis())
        assertNotNull results
        assertTrue(results instanceof Collection)
        assertEquals "wrong size", 1, results.size()

        def ServiceScorecard score = results[0]
        assertTrue score instanceof ServiceScorecard

        //test that all scores are 0
        assertEquals "wrong value", 0f, score.goalsMetPct
        assertEquals "wrong value", 0f, score.risk
        assertEquals "wrong value", 0f, score.smControlsPct
        assertEquals "wrong value", 0f, score.processCoveragePct
        assertEquals "wrong value", 0f, score.processQualityPct
        assertFalse "wrong value", score.auditsExist
        assertEquals "wrong value", 100f, score.serviceAvailabilityPct
        assertEquals "wrong value", 0f, score.estimatedOutageCost
        assertEquals "wrong value", 0f, score.MTTRTime
        assertEquals "wrong value", 0f, score.MTBFTime
        assertEquals "wrong value", 0f, score.serviceFailuresCount
        assertEquals "wrong value", 0f, score.smActivitiesCount
        assertEquals "wrong value", 0f, score.highImpactActivityPct
        assertEquals "wrong value", 0f, score.adHocActivityCount
        assertEquals "wrong value", 0f, score.processDeviationsCount
        assertEquals "wrong value", 0f, score.smSuccessPct
        assertEquals "wrong value", 0f, score.smActivitiesImpactedAvailabilityCount
        assertEquals "wrong value", 0f, score.smActivitiesUnplannedCount
        assertEquals "wrong value", 0f, score.smActivitiesUnapprovedCount

    }

    void testGenerateScorecardsForDates(){
        Calendar curcal = new GregorianCalendar(2008, 11, 31, 23, 23, 23)
        def dates = serviceScorecardService.determinePreviousWeekForDatetime(curcal.getTimeInMillis())
        Calendar cal2 = new GregorianCalendar()
        cal2.setTimeInMillis(dates.start.getTime())
        cal2.add(Calendar.DAY_OF_MONTH, 2)
        def d1 = cal2.getTime()
        cal2.add(Calendar.HOUR_OF_DAY, 24)
        def d2 = cal2.getTime()
        cal2.add(Calendar.DAY_OF_MONTH, 1)
        def d3 = cal2.getTime()
        cal2.add(Calendar.HOUR_OF_DAY, 24)
        def d4 = cal2.getTime()

        ServiceManagementProcess proc1 = new ServiceManagementProcess(
                name: "test-build1",
                description: "do test build",
                service: testservice,
                category: "build",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc1.save()
        ServiceManagementProcess proc2 = new ServiceManagementProcess(
                name: "test-deploy1",
                description: "do test deploy",
                service: testservice,
                category: "deployment",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc2.save()


        //create an audit
        CapabilityAudit audit = new CapabilityAudit(service: testservice, title: 'test1', auditDate: d2, auditor: testuser)
        assertTrue "couldn't save audit: ${audit}", audit.save() ? true : false
        ServiceManagementProcessScorecard score1 = new ServiceManagementProcessScorecard(process: proc1)
        score1.effectiveness = new ServiceManagementProcessScore(name: 'effectiveness', value: 'low', comment: '')
        score1.reliability = new ServiceManagementProcessScore(name: 'reliability', value: 'low', comment: '')
        score1.consistency = new ServiceManagementProcessScore(name: 'consistency', value: 'low', comment: '')
        score1.safety = new ServiceManagementProcessScore(name: 'safety', value: 'low', comment: '')
        score1.success = new ServiceManagementProcessScore(name: 'success', value: 'low', comment: '')
        audit.addToScorecards(score1)
        ServiceManagementProcessScorecard score2 = new ServiceManagementProcessScorecard(process: proc2)
        score2.effectiveness = new ServiceManagementProcessScore(name: 'effectiveness', value: 'low', comment: '')
        score2.reliability = new ServiceManagementProcessScore(name: 'reliability', value: 'low', comment: '')
        score2.consistency = new ServiceManagementProcessScore(name: 'consistency', value: 'low', comment: '')
        score2.safety = new ServiceManagementProcessScore(name: 'safety', value: 'low', comment: '')
        score2.success = new ServiceManagementProcessScore(name: 'success', value: 'low', comment: '')
        audit.addToScorecards(score2)

        assertTrue "failed to save scorecard: ${audit}", audit.save() ? true : false


        //create availability receipts
        AvailabilityReceipt r1 = new AvailabilityReceipt(service: testservice, level: 50, reporter: testuser, startDate: d1, endDate: d2, comment: '')
        if (!r1.save()) {
            fail "couldn't save avail receipt: ${r1.errors.allErrors}"
        }
        
        AvailabilityReceipt r2 = new AvailabilityReceipt(service: testservice, level: 50, reporter: testuser, startDate: d3, endDate: d4, comment: '', process: proc1)
        if (!r2.save()) {
            fail "couldn't save avail receipt: ${r2.errors.allErrors}"
        }


        //create process receipts
        ProcessReceipt pr1 = new ProcessReceipt(title: 'test 1', date: d1, coordinator: testuser, process: proc1,
                priority: 'low', status: 'planned', outcome: 'withdrawn', impactLevel: 'low', plannedStart: d1, plannedEnd: d2,
                actualStart: d1, actualEnd: d2)
        assertTrue "failed to save process receipt: ${pr1}", pr1.save() ? true : false

        ProcessReceipt pr2 = new ProcessReceipt(title: 'test 2', date: d3, coordinator: testuser, process: proc1,
                priority: 'low', status: 'unplanned', outcome: 'successful', impactLevel: 'high', plannedStart: d3, plannedEnd: d4,
                actualStart: d3, actualEnd: d4)
        assertTrue "failed to save process receipt: ${pr2}", pr2.save() ? true : false


        //generate score

        def Collection results = serviceScorecardService.generateScorecardsForDates(dates.start,dates.end)

        assertNotNull results
        assertEquals "wrong size",1,results.size()

        ServiceScorecard score = results[0]
        assertNull "should have null goals",  score.goals
        assertEquals "wrong value", 0f, score.goalsMetPct
        //check unimplimented calculations
        assertEquals "wrong value", 0f, score.risk
        assertEquals "wrong value", 0f, score.smControlsPct
        assertEquals "wrong value", 0f, score.adHocActivityCount
        assertEquals "wrong value", 0f, score.processDeviationsCount
        assertEquals "wrong value", 0f, score.smActivitiesUnapprovedCount

        //check expected values
        assertEquals "wrong value", 20f, score.processCoveragePct
        assertEquals "wrong value", 33f, score.processQualityPct
        assertTrue "wrong value", score.auditsExist
        //availability was 50% for 2/7 days, so total availability % is 6/7 days 
        assertEquals "wrong value", 100f*(6f/7f), score.serviceAvailabilityPct,0.01f
        assertEquals "wrong value", 2400f, score.estimatedOutageCost
        assertEquals "wrong value", 24f, score.MTTRTime
        assertEquals "wrong value", 24f, score.MTBFTime
        assertEquals "wrong value", 2f, score.serviceFailuresCount
        assertEquals "wrong value", 2f, score.smActivitiesCount
        assertEquals "wrong value", 50f, score.highImpactActivityPct
        assertEquals "wrong value", 50f, score.smSuccessPct
        assertEquals "wrong value", 1f, score.smActivitiesImpactedAvailabilityCount
        assertEquals "wrong value", 1f, score.smActivitiesUnplannedCount


    }

    void testGenerateProcessCoveragePct() {
        //create process with particular category
        ServiceManagementProcess proc1 = new ServiceManagementProcess(
                name: "test-build1",
                description: "do test build",
                service: testservice,
                category: "build",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc1.save()
        def results = serviceScorecardService.genProcessCoverage(testservice)
        //test that coverage is only 1/10
        assertEquals "wrong value", 10f, results

        //add another process of the same category and test again
        ServiceManagementProcess proc2 = new ServiceManagementProcess(
                name: "test-build2",
                description: "do test build",
                service: testservice,
                category: "build",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc2.save()

        results = serviceScorecardService.genProcessCoverage(testservice)
        //coverage hasn't changed
        assertEquals "wrong value", 10f, results

        proc1.delete()
        proc2.delete()

        //create process for each category, test that the coverage is 100%
        def processes = []
        ServiceManagementProcess.processCategories.each {category ->
            ServiceManagementProcess proc = new ServiceManagementProcess(
                    name: "test-${category}",
                    description: "do test ${category}",
                    service: testservice,
                    category: category,
                    automationLevel: "semi",
                    syscontrol: "open-loop",
                    createDate: new Date(),
            )
            proc.save()
            processes << proc
        }
        results = serviceScorecardService.genProcessCoverage(testservice)
        //test that coverage is only 1/10
        assertEquals "wrong value", 100f, results

        processes.each {
            it.delete()
        }
    }

    void testCheckGoalSet() {
        assertFalse serviceScorecardService.checkGoalSet(0, "goalsMetPct")
        assertFalse serviceScorecardService.checkGoalSet(10f, "goalsMetPct")
        assertFalse serviceScorecardService.checkGoalSet(-10f, "goalsMetPct")

        ServiceScorecardBase.metricsList.each {String k ->
            if ("goalsMetPct" != k) {
                if (null == ServiceScorecardBase.metricsPositivity[k] || ServiceScorecardBase.metricsPositivity[k] < 0) {
                    //negative goals
                    assertTrue serviceScorecardService.checkGoalSet(0, k)
                    assertTrue serviceScorecardService.checkGoalSet(10, k)
                    assertTrue serviceScorecardService.checkGoalSet(-10, k)
                } else if (0f == ServiceScorecardBase.metricsPositivity[k]) {
                    //0 positivity goal
                    assertFalse serviceScorecardService.checkGoalSet(0, k)
                    assertFalse serviceScorecardService.checkGoalSet(10, k)
                    assertFalse serviceScorecardService.checkGoalSet(-10, k)
                } else {
                    //positive goals
                    assertFalse serviceScorecardService.checkGoalSet(0, k)
                    assertTrue "positive goal not seen: ${k}", serviceScorecardService.checkGoalSet(10, k)
                    assertFalse serviceScorecardService.checkGoalSet(-10, k)
                }
            }
        }

    }

    void testSetGoalsMetPct() {
        //number of metrics declared, minus 1 for "goalsMetPct" and 1 for "smActivitiesCount" (no positivity so never used as a goal)
        def totalmetrics = ServiceScorecardBase.metricsList.size() - 2f
        def totalauditmetrics = ServiceScorecardBase.auditMetrics.size() * 1.0f

        ServiceScorecard card = new ServiceScorecard(service: testservice)

        //test initial values
        assertEquals "wrong initial value", 0f, card.goalsMetPct
        assertNull "wrong initial value", card.goals
        //enable audit goals
        card.auditsExist = true

        //set goalsMetPct with no goals object
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 0f, card.goalsMetPct

        //create a blank goals object and do it again, all goals will be 0 now
        card.goals = new ServiceScorecardGoals()
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct

        //for all goals, set a positive value for the goal
        ServiceScorecardBase.metricsList.each {k ->
            if ("goalsMetPct" != k) {
                card.goals[k] = 10
                card[k] = 10
            }
        }

        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct

        //disable audit goals
        card.auditsExist = false

        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}",  (100f * (totalmetrics - totalauditmetrics ) / totalmetrics),card.goalsMetPct ,0.01f

        card.auditsExist = true


        card.risk = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.risk = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.risk = 10


        card.smControlsPct = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smControlsPct = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.smControlsPct = 10


        card.processCoveragePct = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.processCoveragePct = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.processCoveragePct = 10


        card.processQualityPct = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.processQualityPct = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.processQualityPct = 10


        card.serviceAvailabilityPct = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.serviceAvailabilityPct = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.serviceAvailabilityPct = 10

        //smaller is better
        card.estimatedOutageCost = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.estimatedOutageCost = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.estimatedOutageCost = 10

        //smaller is better
        card.MTTRTime = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.MTTRTime = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.MTTRTime = 10

        //larger is better
        card.MTBFTime = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.MTBFTime = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.MTBFTime = 10

        //smaller is better
        card.serviceFailuresCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.serviceFailuresCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.serviceFailuresCount = 10

        //smActivitiesCount is not calculated as a goal
        card.smActivitiesCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smActivitiesCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smActivitiesCount = 10

        //smaller is better
        card.highImpactActivityPct = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.highImpactActivityPct = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.highImpactActivityPct = 10

        //smaller is better
        card.adHocActivityCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.adHocActivityCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.adHocActivityCount = 10

        //smaller is better
        card.processDeviationsCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.processDeviationsCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.processDeviationsCount = 10

        //larger is better
        card.smSuccessPct = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smSuccessPct = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.smSuccessPct = 10

        //smaller is better
        card.smActivitiesImpactedAvailabilityCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smActivitiesImpactedAvailabilityCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.smActivitiesImpactedAvailabilityCount = 10

        //smaller is better
        card.smActivitiesUnplannedCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smActivitiesUnplannedCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.smActivitiesUnplannedCount = 10

        //smaller is better
        card.smActivitiesUnapprovedCount = 5
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value", 100f, card.goalsMetPct
        card.smActivitiesUnapprovedCount = 12
        serviceScorecardService.setGoalsMetPct(card)
        assertEquals "wrong value ${card.goalsMetPct}", (100f * (totalmetrics - 1) / totalmetrics),card.goalsMetPct ,0.01f
        card.smActivitiesUnapprovedCount = 10
    }

    void testRisk() {
        println "unimplemented: risk"
//        fail "unimplemented: risk"
    }


    void testSmControlsPct() {
        println "unimplemented: smControlsPct"
//        fail "unimplemented: smControlsPct"
    }

    void testProcessDeviationsCount(){
        println "unimplemented: processDeviationsCount"
//        fail "unimplemented: processDeviationsCount"
    }

    void testAdHocActivityCount(){
        println "unimplemented: adHocActivityCount"
//        fail "unimplemented: adHocActivityCount"
    }

    void testSmActivitiesUnapprovedCount(){
        println "unimplemented: smActivitiesUnapprovedCount"
//        fail "unimplemented: smActivitiesUnapprovedCount"
    }

    void testProcessQualityPct() {
        //create audits with particular ratings for quality, check the process quality average
        ServiceManagementProcess proc1 = new ServiceManagementProcess(
                name: "test-build1",
                description: "do test build",
                service: testservice,
                category: "build",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc1.save()
        Calendar cal = new GregorianCalendar(2008, 11, 31, 23, 23, 23)
        def dates = serviceScorecardService.determinePreviousWeekForDatetime(cal.getTimeInMillis())
        Calendar cal2 = new GregorianCalendar()
        cal2.setTimeInMillis(dates.start.getTime())
        cal2.add(Calendar.DAY_OF_MONTH, 2)



        def results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertFalse "wrong value", results.foundaudits
        assertEquals "wrong value", 0f, results.processQualityPct

        CapabilityAudit audit = new CapabilityAudit(service: testservice, title: 'test1', auditDate: cal2.getTime(), auditor: testuser)
        assertTrue "couldn't save audit: ${audit}", audit.save() ? true : false
        ServiceManagementProcessScorecard score1 = new ServiceManagementProcessScorecard(process: proc1)
        score1.effectiveness = new ServiceManagementProcessScore(name: 'effectiveness', value: 'none', comment: '')
        score1.reliability = new ServiceManagementProcessScore(name: 'reliability', value: 'none', comment: '')
        score1.consistency = new ServiceManagementProcessScore(name: 'consistency', value: 'none', comment: '')
        score1.safety = new ServiceManagementProcessScore(name: 'safety', value: 'none', comment: '')
        score1.success = new ServiceManagementProcessScore(name: 'success', value: 'none', comment: '')
        audit.addToScorecards(score1)
        assertTrue "failed to save scorecard: ${score1}", audit.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 0f, results.processQualityPct

        score1.effectiveness.value = 'low'
        score1.reliability.value = 'low'
        score1.consistency.value = 'low'
        score1.safety.value = 'low'
        score1.success.value = 'low'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 33.0f, results.processQualityPct

        score1.effectiveness.value = 'medium'
        score1.reliability.value = 'medium'
        score1.consistency.value = 'medium'
        score1.safety.value = 'medium'
        score1.success.value = 'medium'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 66.0f, results.processQualityPct


        score1.effectiveness.value = 'high'
        score1.reliability.value = 'high'
        score1.consistency.value = 'high'
        score1.safety.value = 'high'
        score1.success.value = 'high'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 100.0f, results.processQualityPct



        score1.effectiveness.value = 'none'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 80.0f, results.processQualityPct

        score1.reliability.value = 'none'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 60.0f, results.processQualityPct

        score1.consistency.value = 'none'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 40.0f, results.processQualityPct

        score1.safety.value = 'none'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 20.0f, results.processQualityPct

        score1.success.value = 'none'
        assertTrue "failed to save scorecard: ${score1}", score1.save() ? true : false
        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)

        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 0f, results.processQualityPct

        //create new process and add scorecard for it.
        ServiceManagementProcess proc2 = new ServiceManagementProcess(
                name: "test-deploy1",
                description: "do test deploy",
                service: testservice,
                category: "deployment",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        assertTrue "could not save process: ${proc2}", proc2.save() ? true : false

        ServiceManagementProcessScorecard score2 = new ServiceManagementProcessScorecard(process: proc2)
        score2.effectiveness = new ServiceManagementProcessScore(name: 'effectiveness', value: 'none', comment: '')
        score2.reliability = new ServiceManagementProcessScore(name: 'reliability', value: 'none', comment: '')
        score2.consistency = new ServiceManagementProcessScore(name: 'consistency', value: 'none', comment: '')
        score2.safety = new ServiceManagementProcessScore(name: 'safety', value: 'none', comment: '')
        score2.success = new ServiceManagementProcessScore(name: 'success', value: 'none', comment: '')
        audit.addToScorecards(score2)
        assertTrue "failed to save scorecard: ${audit}", audit.save() ? true : false

        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)
        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 0f, results.processQualityPct

        score2.effectiveness.value = 'high'
        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)
        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 10f, results.processQualityPct

        score2.reliability.value = 'high'
        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)
        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 20f, results.processQualityPct

        score2.consistency.value = 'high'
        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)
        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 30f, results.processQualityPct

        score2.safety.value = 'high'
        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)
        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 40f, results.processQualityPct

        score2.success.value = 'high'
        results = serviceScorecardService.genProcessQuality(testservice, dates.start, dates.end)
        assertTrue "wrong value", results.foundaudits
        assertEquals "wrong value", 50f, results.processQualityPct



        score2.delete()
        score1.delete()
        audit.delete()
        proc1.delete()
    }

    void testGenAvailabilityScores() {
        Calendar cal = new GregorianCalendar(2008, 11, 31, 23, 23, 23)
        def dates = serviceScorecardService.determinePreviousWeekForDatetime(cal.getTimeInMillis())



        def Map availresults = serviceScorecardService.genAvailabilityScores(testservice, dates.start, dates.end)
        assertNotNull "null result", availresults
        assertEquals "incorrect results size", 6, availresults.size()
        assertTrue "missing entry", availresults.containsKey('serviceFailuresCount')
        assertTrue "missing entry", availresults.containsKey('MTBFTime')
        assertTrue "missing entry", availresults.containsKey('MTTRTime')
        assertTrue "missing entry", availresults.containsKey('estimatedOutageCost')
        assertTrue "missing entry", availresults.containsKey('serviceAvailabilityPct')
        assertTrue "missing entry", availresults.containsKey('smActivitiesImpactedAvailabilityCount')

        //check values when no availability receipts are found
        assertEquals "incorrect value", 0f, availresults.serviceFailuresCount
        assertEquals "incorrect value", 0f, availresults.MTBFTime
        assertEquals "incorrect value", 0f, availresults.MTTRTime
        assertEquals "incorrect value", 0f, availresults.estimatedOutageCost
        assertEquals "incorrect value", 100f, availresults.serviceAvailabilityPct
        assertEquals "incorrect value", 0f, availresults.smActivitiesImpactedAvailabilityCount

        //create one new availability receipt with 100% service level

        Calendar cal2 = new GregorianCalendar()
        cal2.setTimeInMillis(dates.start.getTime())
        cal2.add(Calendar.DAY_OF_MONTH, 2)
        def d1 = cal2.getTime()
        cal2.add(Calendar.HOUR_OF_DAY, 24)
        def d2 = cal2.getTime()

        AvailabilityReceipt r1 = new AvailabilityReceipt(service: testservice, level: 100, reporter: testuser,
                startDate: d1, endDate: d2, comment: '')
        if (!r1.save()) {
            fail "couldn't save avail receipt: ${r1.errors.allErrors}"
        }

        availresults = serviceScorecardService.genAvailabilityScores(testservice, dates.start, dates.end)
        assertEquals "incorrect value", 0f, availresults.serviceFailuresCount
        assertEquals "incorrect value", 0f, availresults.MTBFTime
        assertEquals "incorrect value", 0f, availresults.MTTRTime
        assertEquals "incorrect value", 0f, availresults.estimatedOutageCost
        assertEquals "incorrect value", 100f, availresults.serviceAvailabilityPct
        assertEquals "incorrect value", 0f, availresults.smActivitiesImpactedAvailabilityCount


        r1.level = 50
        r1.save()

        def dur = (d2.getTime() - d1.getTime()) / 2f
        def tot = dates.end.getTime() - dates.start.getTime()
        println("total: ${tot}, dur: ${dur}")
        availresults = serviceScorecardService.genAvailabilityScores(testservice, dates.start, dates.end)
        assertEquals "incorrect value ${availresults}", 1f, availresults.serviceFailuresCount
        assertEquals "incorrect value ${availresults}", 0f, availresults.MTBFTime
        assertEquals "incorrect value ${availresults}", 24f, availresults.MTTRTime
        assertEquals "incorrect value ${availresults}", 1200f, availresults.estimatedOutageCost
        assertEquals "incorrect value ${availresults}", 100 * ((tot - dur) / tot), availresults.serviceAvailabilityPct
        assertEquals "incorrect value ${availresults}", 0f, availresults.smActivitiesImpactedAvailabilityCount

        //add another avail receipt to induce MTBF, and include process connection to set smActivitiesImpactedAvailabilityCount

        cal2.add(Calendar.DAY_OF_MONTH, 1)
        d1 = cal2.getTime()
        cal2.add(Calendar.HOUR_OF_DAY, 24)
        d2 = cal2.getTime()

        ServiceManagementProcess proc1 = new ServiceManagementProcess(
                name: "test-build1",
                description: "do test build",
                service: testservice,
                category: "build",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc1.save()
        AvailabilityReceipt r2 = new AvailabilityReceipt(service: testservice, level: 50, reporter: testuser,
                startDate: d1, endDate: d2, comment: '', process: proc1)
        if (!r2.save()) {
            fail "couldn't save avail receipt: ${r2.errors.allErrors}"
        }


        availresults = serviceScorecardService.genAvailabilityScores(testservice, dates.start, dates.end)
        assertEquals "incorrect value ${availresults}", 2f, availresults.serviceFailuresCount
        assertEquals "incorrect value ${availresults}", 24f, availresults.MTBFTime
        assertEquals "incorrect value ${availresults}", 24f, availresults.MTTRTime
        assertEquals "incorrect value ${availresults}", 2400f, availresults.estimatedOutageCost
        assertEquals "incorrect value ${availresults}", 100 * ((tot - (dur * 2f)) / tot), availresults.serviceAvailabilityPct
        assertEquals "incorrect value ${availresults}", 1f, availresults.smActivitiesImpactedAvailabilityCount



        //test that a dates that do not match have no results:

        def calX = new GregorianCalendar()
        calX.setTime(cal.getTime())
        calX.add(Calendar.DAY_OF_YEAR,-7)

        def datesX = serviceScorecardService.determinePreviousWeekForDatetime(calX.getTimeInMillis())
        availresults = serviceScorecardService.genAvailabilityScores(testservice, datesX.start, datesX.end)
        assertEquals "incorrect value", 0f, availresults.serviceFailuresCount
        assertEquals "incorrect value", 0f, availresults.MTBFTime
        assertEquals "incorrect value", 0f, availresults.MTTRTime
        assertEquals "incorrect value", 0f, availresults.estimatedOutageCost
        assertEquals "incorrect value", 100f, availresults.serviceAvailabilityPct
        assertEquals "incorrect value", 0f, availresults.smActivitiesImpactedAvailabilityCount

        calX.setTime(cal.getTime())
        calX.add(Calendar.DAY_OF_YEAR,7)
        datesX = serviceScorecardService.determinePreviousWeekForDatetime(calX.getTimeInMillis())
        availresults = serviceScorecardService.genAvailabilityScores(testservice, datesX.start, datesX.end)
        assertEquals "incorrect value", 0f, availresults.serviceFailuresCount
        assertEquals "incorrect value", 0f, availresults.MTBFTime
        assertEquals "incorrect value", 0f, availresults.MTTRTime
        assertEquals "incorrect value", 0f, availresults.estimatedOutageCost
        assertEquals "incorrect value", 100f, availresults.serviceAvailabilityPct
        assertEquals "incorrect value", 0f, availresults.smActivitiesImpactedAvailabilityCount


        proc1.delete()
        r2.delete()
        r1.delete()
    }

    void testGenProcessReceiptScores() {
        Calendar cal = new GregorianCalendar(2008, 11, 31, 23, 23, 23)
        def dates = serviceScorecardService.determinePreviousWeekForDatetime(cal.getTimeInMillis())

        ServiceManagementProcess proc1 = new ServiceManagementProcess(
                name: "test-build1",
                description: "do test build",
                service: testservice,
                category: "build",
                automationLevel: "semi",
                syscontrol: "open-loop",
                createDate: new Date(),
        )
        proc1.save()

        //gen scores with no process receipts
        def Map results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertNotNull results
        assertEquals "wrong size", 4, results.size()
        assertTrue "missing entry", results.containsKey('smActivitiesCount')
        assertTrue "missing entry", results.containsKey('highImpactActivityPct')
        assertTrue "missing entry", results.containsKey('smSuccessPct')
        assertTrue "missing entry", results.containsKey('smActivitiesUnplannedCount')

        assertEquals "incorrect value", 0, results.smActivitiesCount
        assertEquals "incorrect value", 0, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 0, results.smActivitiesUnplannedCount

        //create a process receipt without a success result
        Calendar cal2 = new GregorianCalendar()
        cal2.setTimeInMillis(dates.start.getTime())
        cal2.add(Calendar.DAY_OF_MONTH, 2)
        def d1 = cal2.getTime()
        cal2.add(Calendar.HOUR_OF_DAY, 4)
        def d2 = cal2.getTime()

        ProcessReceipt pr1 = new ProcessReceipt(title: 'test 1', date: d1, coordinator: testuser, process: proc1,
                priority: 'low', status: 'planned', outcome: 'withdrawn', impactLevel: 'low', plannedStart: d1, plannedEnd: d2,
                actualStart: d1, actualEnd: d2)
        assertTrue "failed to save process receipt: ${pr1}", pr1.save() ? true : false

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 1, results.smActivitiesCount
        assertEquals "incorrect value", 0, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 0, results.smActivitiesUnplannedCount

        //create another one


        cal2.add(Calendar.DAY_OF_MONTH, 2)
        def d3 = cal2.getTime()
        cal2.add(Calendar.HOUR_OF_DAY, 4)
        def d4 = cal2.getTime()

        ProcessReceipt pr2 = new ProcessReceipt(title: 'test 2', date: d3, coordinator: testuser, process: proc1,
                priority: 'low', status: 'planned', outcome: 'withdrawn', impactLevel: 'low', plannedStart: d3, plannedEnd: d4,
                actualStart: d3, actualEnd: d4)
        assertTrue "failed to save process receipt: ${pr2}", pr2.save() ? true : false

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 0, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 0, results.smActivitiesUnplannedCount


        //check unplanned count
        pr1.status='unplanned'
        pr1.save()

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 0, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 1, results.smActivitiesUnplannedCount


        pr2.status='emergency'
        pr2.save()

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 0, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 2, results.smActivitiesUnplannedCount

        //check high impact

        pr1.impactLevel='high'
        pr1.save()

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 50, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 2, results.smActivitiesUnplannedCount


        pr2.impactLevel='high'
        pr2.save()

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 100, results.highImpactActivityPct
        assertEquals "incorrect value", 0, results.smSuccessPct
        assertEquals "incorrect value", 2, results.smActivitiesUnplannedCount

        //check success pct
        pr1.outcome='successful'
        pr1.save()

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 100, results.highImpactActivityPct
        assertEquals "incorrect value", 50, results.smSuccessPct
        assertEquals "incorrect value", 2, results.smActivitiesUnplannedCount

        pr2.outcome='successful'
        pr2.save()

        results = serviceScorecardService.genProcessReceiptScores(testservice, dates.start, dates.end)

        assertEquals "incorrect value", 2, results.smActivitiesCount
        assertEquals "incorrect value", 100, results.highImpactActivityPct
        assertEquals "incorrect value", 100, results.smSuccessPct
        assertEquals "incorrect value", 2, results.smActivitiesUnplannedCount

        pr1.delete()
        pr2.delete()
        proc1.delete()
    }
}
