
class ProcessReceipt {

    static hasMany = [impactedAssets:Resource, stakeholders:User, changeReviewers:User, securityReviewers:User]

    static constraints = {
        title(blank:false)
        date(blank:false)
        coordinator(blank:false)
        service(nullable:false, blank: false)
        isAuthorized(nullable:false)
        hasSecuritySignOff(nullable:false)
        motivatingReason(nullable:true)
        nonActionConsequence(nullable:true)
        changeRequestUrl(nullable:true)
        priority(inList:['urgent','high','medium','low'])
		status(inList:['planned','unplanned','emergency'])
		outcome(inList:['withdrawn','aborted','successful'])
		impactLevel(inList:['high','moderate','low'])
        plannedStart(blank:false)
        plannedEnd(blank:false)
        plannedExpectedBenefit(nullable:true)
        actualStart(nullable:true)
        actualEnd(nullable:true)
        worstCaseOutageDuration(nullable:true)
    }

	String title
    Date date

    // "What" questions
	Service service
	String motivatingReason
	String nonActionConsequence
	String status
	URL changeRequestUrl
	String outcome
	String impactLevel
	String priority

	// "Who" questions
	boolean isAuthorized
	boolean hasSecuritySignOff

	User coordinator	

	// "When" questions
	Date plannedStart
	Date plannedEnd
	Date plannedExpectedBenefit	
	Date actualStart
	Date actualEnd


	String worstCaseOutcome
	Integer worstCaseOutageDuration


    String toString() {return title}    

    static transients = ['calculateScores']
    //
    // map of metric groupings
    //
    static control_fields = ['coordinator',
            'outcome', 'priority', 'motivatingReason',
            'nonActionConsequence', 'isAuthorized', 'hasSecuritySignOff',
            'changeRequestUrl']
    static repeatability_fields = []


    def Map calculateScores() {
        def scores = ['control':0, 'process':0, 'repeatability':0, 'cumulative':0]
        control_fields.each {
            def val = this."${it}"
            if (val) {
                scores['control'] = scores['control'] + (100 / control_fields.size())
            }
        }
        scores['control'] = scores['control'].intValue()

        //repeatability_fields.each {
        //    def val = this."${it}"
        //    if (val) {
        //        scores['repeatability'] = scores['repeatability'] + (100 / repeatability_fields.size())
        //    }
        //}
        scores['repeatability'] = 100
        scores['repeatability'] = scores['repeatability'].intValue()

        scores['cumulative'] = ((scores['control']
                +scores['repeatability'])/3).intValue()

        return scores
    }
}
