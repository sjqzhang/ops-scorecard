class ServiceManagementProcessScorecard {

    static metrics = ['effectiveness', 'reliability', 'consistency', 'safety', 'success']
    static constraints = {
        audit(nullable: false)
        process(nullable: false)
        effectiveness(nullable: true)
        reliability(nullable: true)
        consistency(nullable: true)
        safety(nullable: true)
        success(nullable: true)
    }
    ServiceManagementProcess process
    CapabilityAudit audit

    static embedded = metrics
    ServiceManagementProcessScore effectiveness
    ServiceManagementProcessScore reliability
    ServiceManagementProcessScore consistency
    ServiceManagementProcessScore safety
    ServiceManagementProcessScore success

    def calculateScores() {
        def scores = [:]
        def total = 0
        [effectiveness, reliability, consistency, safety, success].each { metric ->
            def val = metric.calculateScore()
            scores[metric.name] = val
            total += val
        }
        scores['cumulative'] = (total/embedded.size()).intValue()
        println("DEBUG: ProcessScorecard#calculateScores: cumulative: ${scores['cumulative']}")
        return scores
    }

    static transients = ['calculateScores']
}



class ServiceManagementProcessScore {
    static values = ['none','low', 'medium', 'high']
    static constraints = {
        name(nullable: false)
        value(nullable: false)
        comment(nullable: true)
    }
    static belongsTo = ServiceManagementProcessScorecard
    String name
    String value
    String comment

    String toString() {
        return "ServiceManagementProcessScore{name=${name},value=${value},comment=${comment}}"
    }

    static transients = ['calculateScore']

    def Integer calculateScore() {
        def score = 0
        switch (value) {
            case 'none':
                score = 0
                break
            case 'low':
                score = 33
                break
            case 'medium':
                score = 66
                break
            case 'high':
                score = 100
                break
        }
        return score
    }
}

