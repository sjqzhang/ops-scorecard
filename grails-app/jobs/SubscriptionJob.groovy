class SubscriptionJob {
    def ScorecardService scorecardService
    def EmailService emailService

    def cronExpression = "0 6 * ? * *"



    def execute() {
        def criteria = Subscription.createCriteria()

        def subscribedUsers = criteria.list {
            projections {
                distinct("user")
            }
        }
        subscribedUsers.each {User user ->
            def subscribedServices = Subscription.findAllByUser(user).service
            subscribedServices.each {service ->

                // generate a service report
                def today = new Date()
                def scorecardParams = new ScorecardParams(
                        startDate: today - 7,
                        endDate: today,
                        service: service)
                def bodyContent = scorecardService.generateScoresReportAsText(
                        service,
                        scorecardParams,
                        ['audit', 'activity', 'change'])

                // send out the email
                if (user.email) {
                    emailService.sendMail(user, "Scorecard report", bodyContent)
                }

            }
        }
    }
}
