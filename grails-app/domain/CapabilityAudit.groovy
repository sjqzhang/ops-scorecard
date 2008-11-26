class CapabilityAudit {

    static hasMany = [stakeholders: User, changeReviewers: User, securityReviewers: User, impactedResources: Resource]
    static optionals = ['ticketService', 'hasWorstCaseOutcome', 'hasWorstCaseOutageDuration',
            'changeOwner', 'changeCoordinator']
    static constraints = {
        title(blank: false)
        auditor(blank: false)
        auditDate(blank: false)
        targetedService(nullable:false, blank: false)
        historicalSuccessRating(inList: ['1', '2', '3', '4', '5'])
        changeCoordinator(nullable: true)
        changeOwner(nullable: true)
        handoffProcess(nullable: true)
        softwareAcceptanceProcess(nullable: true)
        targetedService(nullable: true)
        ticketService(nullable: true)
        verifyingBusinessProcesses(nullable: true)
        implementationProcess(nullable: true)
        escalationProcess(nullable: true)
        backoutProcess(nullable: true)
        buildProcess(nullable: true)
        changeDetectionProcess(nullable: true)
        releaseEngineers(nullable: true)
        releaseArtifact(nullable: true)
        numberTimesImplementationProcessRun(nullable: true)
        processDeviationPercentage(nullable: true)
    }

    // basic info
    String title
    Date auditDate
    User auditor
    Service targetedService

    // control questions (phase 1)
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
    String historicalSuccessRating
    boolean hasWorstCaseOutcome
    boolean hasWorstCaseOutageDuration
    Integer processDeviationPercentage
    Integer numberTimesImplementationProcessRun

    // process and inventory questions (phase 2)
    ServiceManagementProcess verifyingBusinessProcesses
    ServiceManagementProcess implementationProcess
    ServiceManagementProcess escalationProcess
    ServiceManagementProcess backoutProcess
    ServiceManagementProcess changeDetectionProcess

    // repeatability and repository questions (phase 3)
    Usergroup releaseEngineers
    ServiceManagementProcess buildProcess
    ServiceManagementProcess handoffProcess
    ServiceManagementProcess softwareAcceptanceProcess
    boolean isBuildEasierThanRepair
    boolean hasBeenPatched
    ReleaseArtifact releaseArtifact

    String toString() {return title}

    static transients = ['calculateScores','toGrade']

    //
    // map of metric groupings
    //
    static control_fields = ['changeCoordinator', 'changeOwner',
            'hasChangeManagementNotes', 'canAssessChangeOutcome', 'canAssessPriority',
            'hasSuccessCriteria', 'hasNonActionConsequence', 'hasPlannedStart',
            'hasPlannedEnd', 'hasPlannedExpectedBenefit', 'hasWorstCaseOutcome',
            'hasWorstCaseOutageDuration']
    static process_fields = ['targetedService', 'ticketService', 'verifyingBusinessProcesses',
            'implementationProcess', 'escalationProcess', 'backoutProcess', 'changeDetectionProcess']
    static repeatability_fields = ['releaseEngineers', 'buildProcess', 'softwareAcceptanceProcess',
            'isBuildEasierThanRepair', 'hasBeenPatched', 'releaseArtifact']


    def Map calculateScores() {
        def scores = ['control':0, 'process':0, 'repeatability':0, 'cumulative':0]
        control_fields.each {
            def val = this."${it}"
            if (val) {
                scores['control'] = scores['control'] + (100 / control_fields.size())
            }
        }
        scores['control'] = scores['control'].intValue()

        process_fields.each {
            def val = this."${it}"
            if (val) {
                scores['process'] = scores['process'] + (100 / process_fields.size())
            }
        }
        scores['process'] = scores['process'].intValue()

        repeatability_fields.each {
            def val = this."${it}"
            if (val) {
                scores['repeatability'] = scores['repeatability'] + (100 / repeatability_fields.size())
            }
        }
        scores['repeatability'] = scores['repeatability'].intValue()

        scores['cumulative'] = ((scores['control']
                +scores['process']
                +scores['repeatability'])/3).intValue()

        return scores
    }
}