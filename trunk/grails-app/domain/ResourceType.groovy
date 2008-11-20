class ResourceType {
    static hasMany = [instances:Resource ]

    static constraints = {
		name(unique:true,length:3..30)
	}
	String name
	String description

    String toString() {return name}
}
