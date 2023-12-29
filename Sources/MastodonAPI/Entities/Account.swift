import Foundation

extension Entities {
    public struct Account: Codable, Sendable {
        public let acct: String
        public let avatarURL: URL
        public let creationDate: Date
        public let displayName: String
        public let emojis: [CustomEmoji]
        public let fields: [Field]
        public let followerCount: Int
        public let followingCount: Int
        public let headerURL: URL
        public let id: String
        public let note: String
        public let staticAvatarURL: URL
        public let staticHeaderURL: URL
        public let statusCount: Int
        public let url: URL
        public let username: String
        
        private enum CodingKeys: String, CodingKey {
            case acct
            case avatarURL = "avatar"
            case creationDate = "created_at"
            case displayName = "display_name"
            case emojis
            case fields
            case followerCount = "followers_count"
            case followingCount = "following_count"
            case headerURL = "header"
            case id
            case note
            case staticAvatarURL = "avatar_static"
            case staticHeaderURL = "header_static"
            case statusCount = "statuses_count"
            case url
            case username
        }
    }
}
