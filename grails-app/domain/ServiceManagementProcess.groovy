class ServiceManagementProcess {
    static constraints = {
        name(blank: false)
        description(blank: false)
        category(inList: ['acceptance', 'build', 'detective', 'escalation', 'imlementation', 'release', 'verification'])
        automationLevel(inList: ['none', 'manual','semi', 'full'])
        syscontrol(inList: ['open-loop', 'closed-loop'])
        artifacts(nullable: true)
        notificationRecipients(nullable: true)
        implementor(nullable: true)
        targetResource(nullable: true)
        recipient(nullable: true)
    }

    String name
    String description
    String category
    String automationLevel
    String syscontrol

    static hasMany = [artifacts: ReleaseArtifact, notificationRecipients: User]

    User implementor
    Service targetResource

    User recipient

    String toString() {return name}

    static transients = ['calculateScores','zerodScores']

    static Map zerodScores() {
        return ['automationLevel': 0, 'syscontrol': 0, 'targetResource': 0,
                'implementor': 0, 'receipient': 0, 'cumulative': 0]
    }

    def Map calculateScores() {
        def scores = zerodScores()
        switch (automationLevel) {
            case 'none':
                scores['automationLevel'] = 0
                break
            case 'manual':
                scores['automationLevel'] = 50
                break
            case 'semi':
                scores['automationLevel'] = 75
                break
            case 'full':
                scores['automationLevel'] = 100
                break
        }
        switch (syscontrol) {
            case 'open-loop':
                scores['syscontrol'] = 75
                break
            case 'closed-loop':
                scores['syscontrol'] = 100
                 break
        }

        if (targetResource) {
            scores['targetResource'] = 100
        }
        if (implementor) {
            scores['implementor'] = 100
        }
        if (recipient) {
            scores['recipient'] = 100
        }

        def scoreTotal = scores.values().asList().sum()

        
        println("DEBUG: values=${scores.values}, scoreTotal=${scoreTotal}")
        scores['cumulative'] = (scoreTotal/scores.size()).intValue()
        println("DEBUG: cumulative=${scores['cumulative']}")
        return scores
    }
}
