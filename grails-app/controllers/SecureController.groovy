/**
 * Created by IntelliJ IDEA.
 * User: alexh
 * Date: Nov 16, 2008
 * Time: 12:12:37 PM
 * To change this template use File | Settings | File Templates.
 */
abstract public class SecureController {

    def beforeInterceptor = [ action: this.&auth,
            except: [ 'handleLogin', 'login', 'handleRegistration', 'register']
        ]

    private auth() {
        if (!session.user) {
            redirect(controller:'user', action: 'login')
            return false
        }
    }
}
