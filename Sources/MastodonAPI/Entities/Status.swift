import Foundation

extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let content: String
        public let creationDate: Date
        public let id: String
        public let inReplyToAccountID: String?
        public let inReplyToID: String?
        public let isBookmarked: Bool
        public let isFavorited: Bool
        public let isReblogged: Bool
        public let isSensitive: Bool
        public let mediaAttachments: [MediaAttachment]
        public let mentions: [Mention]
        public let reblog: Status?
        public let spoilerText: String?
        public let url: URL?
        public let visibility: String

        private enum CodingKeys: String, CodingKey {
            case account
            case content
            case creationDate = "created_at"
            case id
            case inReplyToAccountID = "in_reply_to_account_id"
            case inReplyToID = "in_reply_to_id"
            case isBookmarked = "bookmarked"
            case isFavorited = "favourited"
            case isReblogged = "reblogged"
            case isSensitive = "sensitive"
            case mediaAttachments = "media_attachments"
            case mentions
            case reblog
            case spoilerText = "spoiler_text"
            case url
            case visibility
        }
    }
}
