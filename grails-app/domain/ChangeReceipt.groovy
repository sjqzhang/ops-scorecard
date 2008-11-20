
class ChangeReceipt {

    static hasMany = [impactedAssets:Resource, stakeholders:User, changeReviewers:User, securityReviewers:User]
    static optionals = ['changeRequestUrl','worstCaseOutcome','worstCaseOutageDuration',
            'implementationProcess','verificationProcess','escalationProcess','backoutProcess']
    static constraints = {
        title(blank:false)
        coordinator(blank:false)
        targetedService(blank:false)
        owner(nullable:true)
        isAuthorized(nullable:false)
        hasSecuritySignOff(nullable:false)
        motivatingReason(nullable:true)
        nonActionConsequence(nullable:true)
        changeRequestUrl(nullable:true)
        priority(inList:['urgent','high','medium','low'])
		changeStatus(inList:['planned','unplanned','emergency'])
		changeOutcome(inList:['withdrawn','aborted','successful'])
		changeImpactLevel(inList:['high','moderate','low'])
        plannedStart(blank:false)
        plannedEnd(blank:false)
        plannedExpectedBenefit(nullable:true)
        actualStart(nullable:true)
        actualEnd(nullable:true)
        implementationProcess(nullable:true)
        verificationProcess(nullable:true)
        escalationProcess(nullable:true)
        backoutProcess(nullable:true)
        worstCaseOutageDuration(nullable:true)
        releaseEngineer(nullable:true)
        buildProcess(nullable:true)
        handoffProcess(nullable:true)
        softwareAcceptanceProcess(nullable:true)
        releaseArtifact(nullable:true)
    }

	String title
		
	// "What" questions
	Service targetedService
	String motivatingReason
	String nonActionConsequence
	String changeStatus
	URL changeRequestUrl
	String changeOutcome
	String changeImpactLevel
	String priority

	// "Who" questions
	boolean isAuthorized
	boolean hasSecuritySignOff
	User owner
	User coordinator	

	// "When" questions
	Date plannedStart
	Date plannedEnd
	Date plannedExpectedBenefit	
	Date actualStart
	Date actualEnd

	// "How" questions
	ServiceManagementProcess implementationProcess
	ServiceManagementProcess verificationProcess
	ServiceManagementProcess escalationProcess
	ServiceManagementProcess backoutProcess
	String worstCaseOutcome
	Integer worstCaseOutageDuration

    // repeatability and repository questions (phase 3)
	User releaseEngineer
	ServiceManagementProcess buildProcess
	ServiceManagementProcess handoffProcess
	ServiceManagementProcess softwareAcceptanceProcess
	ReleaseArtifact releaseArtifact

    String toString() {return title}    

}
