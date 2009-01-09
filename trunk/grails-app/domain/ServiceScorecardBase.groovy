class ServiceScorecardBase {

    /** Service Info scores */
    float goalsMetPct
    float risk

    /** audit scores */
    float smControlsPct
    float processCoveragePct
    float processQualityPct
    boolean auditsExist

    /** Performance scores */
    float serviceAvailabilityPct
    float estimatedOutageCost
    float MTTRTime
    float MTBFTime
    int serviceFailuresCount

    /** service management scores */
    int smActivitiesCount
    float highImpactActivityPct
    int adHocActivityCount
    int processDeviationsCount
    float smSuccessPct
    int smActivitiesImpactedAvailabilityCount
    int smActivitiesUnplannedCount
    int smActivitiesUnapprovedCount


    /**
     * list of all metrics from audits
     */
    static auditMetrics=['smControlsPct','processQualityPct']

    /**
     * list of all metric property names
     */
    static metricsList=['goalsMetPct','risk','smControlsPct','processCoveragePct','processQualityPct',
    'serviceAvailabilityPct','estimatedOutageCost','MTTRTime','MTBFTime','serviceFailuresCount',
    'smActivitiesCount','highImpactActivityPct','adHocActivityCount','processDeviationsCount','smSuccessPct','smActivitiesImpactedAvailabilityCount',
    'smActivitiesUnplannedCount','smActivitiesUnapprovedCount']

    /**
     * declares value display type.
     * %: percentage
     * h: time in hours
     * $: currency
     */
    static metricsTypes=['goalsMetPct':'%',risk:'%','smControlsPct':'%','processCoveragePct':'%','processQualityPct':'%',
    'serviceAvailabilityPct':'%','estimatedOutageCost':'$','MTTRTime':'h','MTBFTime':'h','smSuccessPct':'%',
    'highImpactActivityPct':'%']

    /** declares which metrics are better larger or smaller.  a positive entry means that a higher metric is better,
     * a negative entry (or no entry) means lower is better
     * a zero entry means neither is better
     */
    static metricsPositivity=[
            goalsMetPct:1.0, smControlsPct:1.0,processCoveragePct:1.0,processQualityPct:1.0,serviceAvailabilityPct:1.0,
            smSuccessPct:1.0,
            MTBFTime:1.0,
            smActivitiesCount:0.0]

    public String toString() {
        return """ServiceScorecardBase[
goalsMetPct: ${goalsMetPct},
risk: ${risk},
smControlsPct: ${smControlsPct},
processCoveragePct: ${processCoveragePct},
processQualityPct: ${processQualityPct},
auditsExist: ${auditsExist},
serviceAvailabilityPct: ${serviceAvailabilityPct},
estimatedOutageCost: ${estimatedOutageCost},
MTTRTime: ${MTTRTime},
MTBFTime: ${MTBFTime},
serviceFailuresCount: ${serviceFailuresCount},
smActivitiesCount: ${smActivitiesCount},
highImpactActivityPct: ${highImpactActivityPct},
adHocActivityCount: ${adHocActivityCount},
processDeviationsCount: ${processDeviationsCount},
smSuccessPct: ${smSuccessPct},
smActivitiesImpactedAvailabilityCount: ${smActivitiesImpactedAvailabilityCount},
smActivitiesUnplannedCount: ${smActivitiesUnplannedCount},
smActivitiesUnapprovedCount: ${smActivitiesUnapprovedCount},
""";
    }


}
