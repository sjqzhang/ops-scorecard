class InventoryService {

    boolean transactional = true

    def List listAdded(Date startDate, Date endDate) {
       def results = []
        results = Resource.findAllByCreateDateBetween(startDate, endDate)
        println("DEBUG: listAdded: number added results: ${results.size()}")
        return results
    }

    def List listAddedThisWeek() {
        return listAdded(new Date()-6, new Date()+1)
    }
}
