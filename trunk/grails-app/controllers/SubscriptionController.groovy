class SubscriptionController extends SecureController {
    

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST']

    def list = {
        [ subscriptionInstanceList: Subscription.findAllByUser( session.user, params ) ]
    }

   def create = {
        def subscription = new Subscription()
        subscription.properties = params
        return ['subscription':subscription]
    }

    def delete = {
        def subscriptionInstance = Subscription.get( params.id )
        subscriptionInstance?.delete()
        render(template:"subscription",
                var:"subscription",
                collection:Subscription.findAllByUser(session.user))
    }

    def save = {
        def s = Service.get(params.service.id)
        if (!Subscription.findByUserAndService(session.user,s)) {
            new Subscription(user:session.user, service:s).save()
        }
        render(template:"subscription",
                var:"subscription",
                collection:Subscription.findAllByUser(session.user))
    }
}
