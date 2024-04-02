import Foundation

extension Entities {
    public struct Account: Codable, Sendable {
        public let acct: String
        public let avatarURL: URL
        public let displayName: String
        public let headerURL: URL
        public let id: String
        public let staticAvatarURL: URL
        public let staticHeaderURL: URL
        public let url: URL
        public let username: String

        private enum CodingKeys: String, CodingKey {
            case acct
            case avatarURL = "avatar"
            case displayName = "display_name"
            case headerURL = "header"
            case id
            case staticAvatarURL = "avatar_static"
            case staticHeaderURL = "header_static"
            case url
            case username
        }
    }
}
