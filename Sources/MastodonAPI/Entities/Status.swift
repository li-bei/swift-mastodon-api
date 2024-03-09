import Foundation

extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let content: String
        public let creationDate: Date
        public let id: String
        public let reblog: Status?

        private enum CodingKeys: String, CodingKey {
            case account
            case content
            case creationDate = "created_at"
            case id
            case reblog
        }
    }
}
