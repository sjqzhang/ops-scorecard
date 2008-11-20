class CapabilityScoreCard {
    static constraints = {
        startDate(nullable:false)
        endDate(nullable:false)
        service(nullable:false)
        controlScore(blank:false)
        controlTrend(blank:false)
        processScore(blank:false)
        processTrend(blank:false)
        repeatabilityScore(blank:false)
        repeatabilityTrend(blank:false)
    }
    Date startDate
    Date endDate
    Service service

    Integer controlScore
    String controlTrend
    Integer processScore
    String processTrend
    Integer repeatabilityScore
    String repeatabilityTrend

    static transients = ['grade','calculateCumulativeScore','calculateCumulativeTrend']
    def String toGrade(Integer score) {
        def grade = ''
        switch (score) {
            case 95..100:
                grade = 'A'
                break
            case 90..95:
                grade = 'A-'
                break
            case 85..90:
                grade = 'B+'
                break
            case 80..85:
                grade = 'B-'
                break
            case 75..80:
                grade = 'C+'
                break
            case 70..75:
                grade = 'C'
                break
            case 65..75:
                grade = 'C-'
                break
            case 60..65:
                grade = 'D+'
                break
            case 55..60:
                grade = 'D-'
                break
            case 50..55:
                grade = 'F+'
                break
            case 0..50:
                grade = 'F'
                break
        }
        return grade
    }

    def Integer calculateCumulativeScore() {
        return (controlScore + processScore + repeatabilityScore)/3
    }

    // hack way of producing a cumulative trend. just something to support the early dev
    def String calculateCumulativeTrend() {
        def trendmap = [up:1,down:-1, flat:0]
        def result = trendmap[controlTrend] + trendmap[processTrend] + trendmap[repeatabilityTrend]
        def trend
        if (result >0) {
           trend = "up"
        } else if (result <0) {
            trend = "down"
        } else {
            trend = "flat"
        }
        return trend
    }

}
