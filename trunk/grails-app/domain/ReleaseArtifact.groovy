class ReleaseArtifact extends Resource {
    static optionals = ['description','repositoryURL']
    static constraints = {
          repositoryURL(nullable:true)
    }

    URL repositoryURL

        static transients = ['calculateScores']

    def Map calculateScores() {
        def scores = [:]
        scores['cumulative'] = 100
        return scores
    }
}