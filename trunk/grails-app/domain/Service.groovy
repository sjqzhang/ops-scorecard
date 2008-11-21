class Service extends Resource {
    static optionals = ['outageCost']
    static constraints = {
        outageCost(nullable:true)
        customer(nullable:true)
        serviceURL(nullable:true)
    }
	
	String outageCost
	User customer
    URL serviceURL

    String toString() {
        return "${name} [${type.name}]"
    }
}