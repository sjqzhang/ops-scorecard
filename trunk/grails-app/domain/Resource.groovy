// VISOPS pp 86-87

class Resource {

    static belongsTo = ResourceType
    static optionals = ['category','function','ticketNumbers','reprovisioningDuration','ownerResponsible']
    static constraints = {
        name(blank:false)
        type(blank:false)
        description(nullable:true)
        status(inList:['Installed','Ordered','Registered','Accepted','Development',
                'Testing','Under change','DSL','DHL','Archived','Obsolete','Missing','Stolen'])
        function(nullable:true)
        ownerResponsible(nullable:true)
        dateAcquired(nullable:true)
        nextMaintenanceWindow(nullable:true)
        ticketNumbers(nullable:true)
        reprovisioningDuration(nullable:true)

	}
    
    String name
	ResourceType type
	String description
	
	String function
	User ownerResponsible
	Date dateAcquired
	Date nextMaintenanceWindow
	
	String status
	String ticketNumbers
		
	boolean isFragile
	boolean isMonitored
	boolean isMissionCritical
	boolean isRebuildable
	String reprovisioningDuration

    String toString() {return name}        
}
