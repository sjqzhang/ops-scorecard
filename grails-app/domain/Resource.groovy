// VISOPS pp 86-87

class Resource {

    static belongsTo = ResourceType
    static optionals = ['category','function','ticketNumbers','reprovisioningDuration','ownerResponsible']
    static constraints = {
        name(blank:false)
        type(blank:false)
        description(blank:false)
        createDate(nullable:false)
        status(inList:['Installed','Ordered','Registered','Accepted','Development',
                'Testing','Production','Under change','DSL','DHL','Archived','Obsolete','Missing','Stolen'])
        function(nullable:true)
        ownerResponsible(nullable:true)
        dateAcquired(nullable:true)
        nextMaintenanceWindow(nullable:true)
        reprovisioningDuration(nullable:true)
        ciUri(nullable:true)

    }
    
    String name
	ResourceType type
	String description
    Date createDate

    String function
	User ownerResponsible
	Date dateAcquired
	Date nextMaintenanceWindow
	
	String status
		
	boolean isFragile
	boolean isMonitored
	boolean isMissionCritical
	boolean isRebuildable
	String reprovisioningDuration

    URL ciUri

    def beforeInsert = {
        createDate = new Date()
    }

    String toString() {return name}

    static transients = ['calculateScores']

    def Map calculateScores() {
        def scores = [:]
        scores['cumulative'] = 100
        return scores
    }

}
