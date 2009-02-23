class Service extends Resource {
    static optionals = ['outageCost','goals']
    static constraints = {
        outageCost(nullable:true)
        customer(nullable:true)
        serviceURL(nullable:true)
        goals(nullable:true)
    }
	
	Integer outageCost = 0 // hourly
	User customer
    URL serviceURL
    ServiceScorecardGoals goals

    def beforeInsert = {
        createDate = new Date()
    }
    String toString() {
        return "${name} [${type.name}]"
    }
    static transients = ['calculateScores']

    def Map calculateScores() {
        def scores = [:]
        scores['cumulative'] = 100
        return scores
    }
}