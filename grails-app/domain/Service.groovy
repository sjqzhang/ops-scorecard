class Service extends Resource {
    static optionals = ['outageCost']
    static constraints = {
        outageCost(nullable:true)
        customer(nullable:true)
        serviceURL(nullable:true)
    }
	
	Integer outageCost   // hourly
	User customer
    URL serviceURL

    String toString() {
        return "${name}"
    }
    static transients = ['calculateScores']

    def Map calculateScores() {
        def scores = [:]
        scores['cumulative'] = 100
        return scores
    }
}