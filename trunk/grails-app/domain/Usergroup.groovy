class Usergroup {
    static hasMany = [ users:User ]

    static constraints = {
        name(nullable:false)
        description(nullable:true)
        function(inList:['control','security','developer','operations'])

    }
    String name
	String description
    String function

    String toString() {return name}    

}
