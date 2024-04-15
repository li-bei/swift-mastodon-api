import Foundation

extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let content: String
        public let creationDate: Date
        public let emojis: [CustomEmoji]
        public let favoriteCount: Int
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
        public let reblogCount: Int
        public let replyCount: Int
        public let spoilerText: String?
        public let tags: [Tag]
        public let url: URL?
        public let visibility: String

        private enum CodingKeys: String, CodingKey {
            case account
            case content
            case creationDate = "created_at"
            case emojis
            case favoriteCount = "favourites_count"
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
            case reblogCount = "reblogs_count"
            case replyCount = "replies_count"
            case spoilerText = "spoiler_text"
            case tags
            case url
            case visibility
        }
    }
}
