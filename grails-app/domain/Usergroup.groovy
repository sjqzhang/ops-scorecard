class Usergroup {
    static hasMany = [ users:User ]

    static constraints = {
        name(nullable:false)
        description(nullable:true)
        function(inList:['control','security','development','operations'])
        createDate(nullable:false)

    }
    String name
	String description
    String function
    Date createDate

    String toString() {return name}    

}
