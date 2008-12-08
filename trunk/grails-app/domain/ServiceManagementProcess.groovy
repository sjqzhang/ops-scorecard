class ServiceManagementProcess {
    static constraints = {
        name(blank: false)
        description(blank: false)
        createDate(nullable:false)
        category(inList: ['acceptance', 'build', 'change','configuration', 'detective', 'escalation',
                'implementation', 'release', 'deployment','monitoring', 'verification'])
        automationLevel(inList: ['none', 'manual','semi', 'full'])
        automationTool(nullable:true)
        syscontrol(inList: ['open-loop', 'closed-loop'])
        artifactType(nullable: true)
        notificationRecipients(nullable: true)
        implementor(nullable: true)
        service(nullable: true)
        recipient(nullable: true)
        procedure(nullable: true)
        managers(nullable:true)
    }

    String name
    String description
    Date createDate
    String category
    String automationLevel
    String automationTool
    
    String syscontrol

    ResourceType artifactType

    static hasMany = [notificationRecipients: User]

    Usergroup implementor
    Service service

    String procedure

    Usergroup recipient

    Usergroup managers


    String toString() {return name}

    static transients = ['calculateScores','zerodScores']

    static Map zerodScores() {
        return ['automationLevel': 0, 'syscontrol': 0, 'service': 0,
                'implementor': 0, 'receipient': 0, 'cumulative': 0]
    }

    static metrics = ServiceManagementProcessScorecard.metrics
    
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

        if (service) {
            scores['service'] = 100
        }
        if (implementor) {
            scores['implementor'] = 100
        }
        if (recipient) {
            scores['recipient'] = 100
        }

        def scoreTotal = scores.values().asList().sum()
        def cumulative
        if (scoreTotal>=scores.size()) {
            cumulative= scoreTotal
        } else {
            cumulative = (scoreTotal/scores.size()).intValue()
        }
                        
        //println("DEBUG: values=${scores.values}, scoreTotal=${scoreTotal}")
        scores['cumulative'] = (scoreTotal/scores.size()).intValue()
        //println("DEBUG: cumulative=${scores['cumulative']}")
        return scores
    }
}     
