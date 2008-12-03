import org.codehaus.groovy.grails.commons.ConfigurationHolder

class SubscriptionJob {
    def ScorecardService scorecardService
    def EmailService emailService
    
    def cronExpression = ConfigurationHolder.config.subscription.cronExpression



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
                        startDate: today - 6,
                        endDate: today + 1,
                        service: service)
                def bodyContent = scorecardService.generateScoresReportAsText(
                        service,
                        scorecardParams,
                        ['audit', 'process', 'activity'])

                // send out the email
                if (user.email) {
                    emailService.sendMail(user, "Scorecard report for service: ${service.name}", bodyContent)
                    log.info("Emailed report to user: ${user}")
                }

            }
        }
    }
}
