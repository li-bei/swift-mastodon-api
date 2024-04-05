extension Entities {
    public struct WebPushSubscription: Codable, Sendable {
        public let alerts: [String: Bool]
        public let endpoint: String
        public let id: Int
        public let policy: String
        public let serverKey: String

        private enum CodingKeys: String, CodingKey {
            case alerts
            case endpoint
            case id
            case policy
            case serverKey = "server_key"
        }
    }
}
