import Foundation

extension Entities {
    public struct Notification: Codable, Sendable {
        public let account: Account
        public let creationDate: Date
        public let id: String
        public let status: Status?
        public let type: String

        private enum CodingKeys: String, CodingKey {
            case account
            case creationDate = "created_at"
            case id
            case status
            case type
        }
    }
}
