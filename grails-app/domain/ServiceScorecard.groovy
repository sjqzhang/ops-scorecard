class ServiceScorecard extends ServiceScorecardBase{
    /** date */

    Date dateCreated
    Date startDate
    Date endDate

    def beforeInsert = {
        dateCreated = new Date()
    }
    
    Service service
    ServiceScorecardGoals goals


    static constraints = {
        goals(nullable:true)
        service(nullable:false)
    }
}
