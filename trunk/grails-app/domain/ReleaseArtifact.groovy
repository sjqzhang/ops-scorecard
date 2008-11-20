class ReleaseArtifact extends Resource {
    static optionals = ['description','repositoryURL']
    static constraints = {
          repositoryURL(nullable:true)
    }

    URL repositoryURL
}