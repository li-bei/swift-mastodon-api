extension Entities {
    public struct Application: Codable, Sendable {
        public let clientID: String
        public let clientSecret: String

        private enum CodingKeys: String, CodingKey {
            case clientID = "client_id"
            case clientSecret = "client_secret"
        }
    }
}
