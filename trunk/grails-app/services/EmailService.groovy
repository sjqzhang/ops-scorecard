class EmailService {

    boolean transactional = false

    // ApplicationConfig.EMAIL_SERVER
    def EMAIL_SERVER   = ApplicationConfig.EMAIL_SERVER
    def EMAIL_USERNAME = ApplicationConfig.EMAIL_USERNAME
    def EMAIL_PASSWORD = ApplicationConfig.EMAIL_PASSWORD


    def sendMail(User to, String subject, String bodyContent) {
        def email = new org.apache.commons.mail.HtmlEmail(
                hostName: EMAIL_SERVER,
                subject: subject,
                htmlMsg: bodyContent
                )
        email.setAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD)
        email.setFrom(EMAIL_USERNAME, "Ops Scorecard")
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
