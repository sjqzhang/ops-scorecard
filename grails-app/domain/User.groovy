class User {
	static belongsTo = Usergroup
    static optionals = ['description','userGroup']
    static constraints = {
		login(unique:true,length:3..15)
		firstName(blank:false)
        lastName(blank:false)
        userGroup(nullable:true)
        email(nullable:true)
        password(nullable:true)
    }

	String login
	String firstName
	String lastName
	Usergroup userGroup
    String email
    String password

    String toString() {return login}    
}
