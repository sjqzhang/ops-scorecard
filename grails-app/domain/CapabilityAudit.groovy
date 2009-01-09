class CapabilityAudit {

    static hasMany = [stakeholders: User, changeReviewers: User, securityReviewers: User,
            scorecards: ServiceManagementProcessScorecard
    ]

    static constraints = {
        title(blank: false)
        auditor(blank: false)
        auditDate(blank: false)
        service(nullable: false)
        changeCoordinator(nullable: true)
        changeOwner(nullable: true)
        ticketService(nullable: true)
        meanTimeToRepair(nullable: true)
        scorecards(nullable: true)
    }

    // basic info
    String title
    Date auditDate
    User auditor
    Service service

    User changeOwner
    User changeCoordinator
    URL ticketService
    boolean hasChangeManagementNotes
    boolean canAssessChangeOutcome
    boolean canAssessChangeImpactLevel
    boolean canAssessPriority
    boolean hasSuccessCriteria
    boolean hasMotivatingReason
    boolean hasNonActionConsequence
    boolean hasPlannedStart
    boolean hasPlannedEnd
    boolean hasPlannedExpectedBenefit
    String meanTimeToRepair
    boolean hasWorstCaseOutcome
    boolean hasWorstCaseOutageDuration
    boolean isBuildEasierThanRepair
    boolean hasBeenPatched

    String toString() {return title}

    static transients = ['calculateScores', 'toGrade']

    //
    // map of metric groupings
    //
    static control_fields = ['changeCoordinator', 'changeOwner',
            'hasChangeManagementNotes', 'canAssessChangeOutcome', 'canAssessPriority',
            'hasSuccessCriteria', 'hasNonActionConsequence', 'hasPlannedStart',
            'hasPlannedEnd', 'hasPlannedExpectedBenefit', 'hasWorstCaseOutcome',
            'hasWorstCaseOutageDuration', 'service', 'ticketService']


    def Map calculateScores() {
        def scores = ['control': 0, 'process': 0, 'cumulative': 0]

        // control
        control_fields.each {
            def val = this."${it}"
            if (val) {
                scores['control'] = scores['control'] + (100 / control_fields.size())
            }
        }
        scores['control'] = scores['control'].intValue()

        // process
        def total = 0
        scorecards.each {
            def s = it.calculateScores()
            def sc = s['cumulative']
            total += sc
        }
        scores['process'] = (total / ServiceManagementProcess.processCategories.size()).intValue()
        scores['cumulative'] = ((scores['control']
                + scores['process']) / 2).intValue()

        return scores
    }
}
