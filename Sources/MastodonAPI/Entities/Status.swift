import Foundation

extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let content: String
        public let creationDate: Date
        public let id: String
        public let inReplyToAccountID: String?
        public let inReplyToID: String?
        public let reblog: Status?
        public let url: URL?
        public let visibility: String

        private enum CodingKeys: String, CodingKey {
            case account
            case content
            case creationDate = "created_at"
            case id
            case inReplyToAccountID = "in_reply_to_account_id"
            case inReplyToID = "in_reply_to_id"
            case reblog
            case url
            case visibility
        }
    }
}
