import Foundation

extension Entities {
    public struct Account: Codable, Sendable {
        public let acct: String
        public let avatarURL: URL
        public let displayName: String
        public let followerCount: Int
        public let followingCount: Int
        public let headerURL: URL
        public let id: String
        public let isLocked: Bool
        public let note: String
        public let staticAvatarURL: URL
        public let staticHeaderURL: URL
        public let statusCount: Int
        public let url: URL
        public let username: String

        private enum CodingKeys: String, CodingKey {
            case acct
            case avatarURL = "avatar"
            case displayName = "display_name"
            case followerCount = "followers_count"
            case followingCount = "following_count"
            case headerURL = "header"
            case id
            case isLocked = "locked"
            case note
            case staticAvatarURL = "avatar_static"
            case staticHeaderURL = "header_static"
            case statusCount = "statuses_count"
            case url
            case username
        }
    }
}
