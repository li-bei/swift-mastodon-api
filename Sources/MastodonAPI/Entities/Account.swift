import Foundation

extension Entities {
    public struct Account: Codable, Sendable {
        public let acct: String
        public let displayName: String
        public let emojis: [CustomEmoji]
        public let followerCount: Int
        public let followingCount: Int
        public let id: String
        public let staticAvatarURL: URL
        public let staticHeaderURL: URL
        public let username: String
        
        private enum CodingKeys: String, CodingKey {
            case acct
            case displayName = "display_name"
            case emojis
            case followerCount = "followers_count"
            case followingCount = "following_count"
            case id
            case staticAvatarURL = "avatar_static"
            case staticHeaderURL = "header_static"
            case username
        }
    }
}
