extension Entities {
    public struct Account: Codable, Sendable {
        public let id: String

        private enum CodingKeys: String, CodingKey {
            case id
        }
    }
}
