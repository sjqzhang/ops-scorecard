class UserController {

    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [userList: User.list(params)]
    }

    def show = {
        def user
        if (params.id) {
            user = User.get(params.id)
        } else if (params.login) {
            user = User.findByLogin(params.login)
        }        

        if (!user) {
            flash.message = "Individual not found with id ${params.id}"
            redirect(action: list)
        }
        else {return [user: user]}
    }

    def delete = {
        def user = User.get(params.id)
        if (user) {
            user.delete()
            flash.message = "Deleted ${params.login}"
            redirect(action: list)
        }
        else {
            flash.message = "Individual not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def user = User.get(params.id)

        if (!user) {
            flash.message = "Individual not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [user: user]
        }
    }

    def update = {
        def user = User.get(params.id)
        if (user) {
            user.properties = params
            if (!user.hasErrors() && user.save()) {
                flash.message = "Updated: '${params.login}'"
                redirect(action: list)
            }
            else {
                render(view: 'edit', model: [user: user])
            }
        }
        else {
            flash.message = "Individual not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def user = new User()
        user.properties = params
        return ['user': user]
    }

    def save = {
        def user = new User(params)
        if (!user.hasErrors() && user.save()) {
            flash.message = "Created: '${user.login}'"
            redirect(action: list)
        }
        else {
            render(view: 'create', model: [user: user])
        }
    }


    def saveRegistration = {
        def user = new User(params)
        if (!user.hasErrors() && user.save()) {
            flash.message = "Registered: '${user.login}'"
            redirect(controller: 'capabilityScoreCard', action: 'list')
        }
        else {
            render(view: 'create', model: [user: user])
        }
    }

    def login = {
        if (session.user) {
            redirect(url: '/scorecard')
        }
    }

    def handleLogin = {
        def user = User.findByLogin(params.login)
        if (user) {
            if (user.password == params.password) {
                session.user = user
                redirect(url: '/scorecard')
            } else {
                flash.message = "Incorrect password for ${params.login}"
                redirect(action: login)
            }
        } else {
            flash.message = "User not found for login ${params.login}"
            redirect(action: login)
        }
    }

    def register = {}

    def handleRegistration = {
        def user = new User(params)
        if (params.password != params.confirm) {
            flash.message = "The two passwords you entered don't match."
            redirect(action: register)
        } else {
            if (user.save()) {
                redirect(url: '/scorecard')
            } else {
                flash.user = user
                redirect(action: register)
            }
        }
    }

    def logout = {
        session.invalidate()
        redirect(controller: 'user', action: 'login')
    }



    def search = {
        def results = []
        def queryParams = [:]
        if (params.group) queryParams['userGroups'] = params.group
        results = User.findAllWhere(queryParams)
        render(view: 'search', model: [userList: results])
    }
}
