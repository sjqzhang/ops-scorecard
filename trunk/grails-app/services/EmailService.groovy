
import org.springframework.beans.factory.InitializingBean

class EmailService implements InitializingBean {

    boolean transactional = false

    def grailsApplication

    def emailServer
    def emailFrom
    def emailUsername
    def emailPassword

    void afterPropertiesSet() {
        this.emailServer   = grailsApplication.config.email.server
        this.emailFrom     = grailsApplication.config.email.from
        this.emailUsername = grailsApplication.config.email.username
        this.emailPassword = grailsApplication.config.email.password
    }


    def sendMail(User to, String subject, String bodyContent) {
        def email = new org.apache.commons.mail.HtmlEmail(
                hostName: this.emailServer,
                subject: subject,
                htmlMsg: bodyContent
                )
        email.setAuthentication(this.emailUsername, this.emailPassword)
        email.setFrom(this.emailFrom, "Ops Scorecard")
        email.addTo(to.email, "$to")
        println("Sending email: $bodyContent")
        email.send()
    }


    def sendMail(User to, String subject, Closure bodyContent) {
        def sw = new StringWriter()
        def mkp = new groovy.xml.MarkupBuilder(new PrintWriter(sw))
        mkp.html {
            body(bodyContent)
        }
        sendMail(to, subject, sw.toString())
    }

}
