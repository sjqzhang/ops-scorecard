class ResourceType {
    static hasMany = [instances:Resource ]

    static constraints = {
		name(unique:true,length:3..30)
        description(nullable:true)
        metatype(inList:['service','process','artifact','asset'])
    }
	String name
	String description
    String metatype

    String toString() {return name}
}
