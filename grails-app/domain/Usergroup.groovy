class Usergroup {
    static hasMany = [ users:User ]

    static constraints = {
        name(nullable:false)
        description(nullable:true)
        createDate(nullable:false)

    }
    String name
	String description
    Date createDate

    String toString() {return name}    

}
