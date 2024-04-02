extension Entities {
    public struct Relationship: Codable, Sendable {
        public let id: String
        public let isFollowedBy: Bool
        public let isFollowing: Bool
        public let isRequested: Bool

        private enum CodingKeys: String, CodingKey {
            case id
            case isFollowedBy = "followed_by"
            case isFollowing = "following"
            case isRequested = "requested"
        }
    }
}
