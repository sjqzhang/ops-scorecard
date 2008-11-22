class User {

    static optionals = ['description','userGroup']
    static constraints = {
		login(unique:true,length:3..15)
		firstName(blank:false)
        lastName(blank:false)
        email(nullable:true)
        password(nullable:true)
    }

    static belongsTo = Usergroup
    static hasMany = [userGroups:Usergroup]
    String login
	String firstName
	String lastName	
    String email
    String password

    String toString() {return login}    
}
