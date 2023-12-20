extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let id: String
        public let reblog: Status?
        
        private enum CodingKeys: String, CodingKey {
            case account
            case id
            case reblog
        }
    }
}
