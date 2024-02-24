extension Entities {
    public struct Relationship: Codable, Sendable {
        public let id: String
        public let isBlockedBy: Bool
        public let isBlocking: Bool
        public let isDomainBlocking: Bool
        public let isEndorsed: Bool
        public let isFollowedBy: Bool
        public let isFollowing: Bool
        public let isMuting: Bool
        public let isMutingNotifications: Bool
        public let isNotifying: Bool
        public let isRequested: Bool
        public let isRequestedBy: Bool
        public let isShowingReblogs: Bool
        public let languages: String?
        public let note: String
        
        private enum CodingKeys: String, CodingKey {
            case id
            case isBlockedBy = "blocked_by"
            case isBlocking = "blocking"
            case isDomainBlocking = "domain_blocking"
            case isEndorsed = "endorsed"
            case isFollowedBy = "followed_by"
            case isFollowing = "following"
            case isMuting = "muting"
            case isMutingNotifications = "muting_notifications"
            case isNotifying = "notifying"
            case isRequested = "requested"
            case isRequestedBy = "requested_by"
            case isShowingReblogs = "showing_reblogs"
            case languages
            case note
        }
    }
}
