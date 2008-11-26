class Subscription {
    def belongsTo = [User,Service]

    User user
    Service service

    String toString() { "$service" }
}
