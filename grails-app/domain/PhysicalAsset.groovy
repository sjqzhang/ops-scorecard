class PhysicalAsset extends Resource {
    static optionals = ['make','model','operatingSystem','physicalLocation','platform','sourceSupplier']
    static constraints = {
	}	
	
	String make
	String model
	String operatingSystem
	String physicalLocation
	String platform	
	String sourceSupplier

        static transients = ['calculateScores']

    def Map calculateScores() {
        def scores = [:]
        scores['cumulative'] = 100
        return scores
    }
}