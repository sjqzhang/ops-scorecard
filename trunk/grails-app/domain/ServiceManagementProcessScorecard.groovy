
class ServiceManagementProcessScorecard {

    static metrics = ['effectiveness','reliability','deviation','impact','success']
    static constraints = {
        audit(nullable:false)
        process(nullable:false)
        effectiveness(nullable:true)
        reliability(nullable:true)
        impact(nullable:true)
        success(nullable:true)
    }
    ServiceManagementProcess process
    CapabilityAudit audit

    static embedded = ['effectiveness','reliability','deviation','impact','success']
    ServiceManagementProcessScore effectiveness
    ServiceManagementProcessScore reliability
    ServiceManagementProcessScore deviation
    ServiceManagementProcessScore impact
    ServiceManagementProcessScore success
        
}



class ServiceManagementProcessScore {
    static values = ['low','medium','high','none']
    static constraints = {
        value(nullable:false)
        comment(nullable:true)
    }
    static belongsTo = ServiceManagementProcessScorecard
    String value
    String comment

    String toString() {
        return "ServiceManagementProcessScore{value=${value},comment=${comment}}"
    }
}

