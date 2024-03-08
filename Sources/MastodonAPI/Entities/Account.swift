extension Entities {
    public struct Account: Codable, Sendable {
        public let acct: String
        public let id: String
        public let username: String

        private enum CodingKeys: String, CodingKey {
            case acct
            case id
            case username
        }
    }
}
