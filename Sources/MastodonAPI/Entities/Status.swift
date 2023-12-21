extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let id: String
        public let isFavorited: Bool
        public let isReblogged: Bool
        public let reblog: Status?
        
        private enum CodingKeys: String, CodingKey {
            case account
            case id
            case isFavorited = "favourited"
            case isReblogged = "reblogged"
            case reblog
        }
    }
}
