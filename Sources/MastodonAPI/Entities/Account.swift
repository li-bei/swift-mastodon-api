extension Entities {
    public struct Account: Codable, Sendable {
        public let acct: String
        public let displayName: String
        public let followerCount: Int
        public let followingCount: Int
        public let id: String
        public let username: String
        
        private enum CodingKeys: String, CodingKey {
            case acct
            case displayName = "display_name"
            case followerCount = "followers_count"
            case followingCount = "following_count"
            case id
            case username
        }
    }
}
