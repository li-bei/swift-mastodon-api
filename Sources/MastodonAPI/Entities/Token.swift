extension Entities {
    public struct Token: Codable, Sendable {
        public let accessToken: String

        private enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
        }
    }
}
