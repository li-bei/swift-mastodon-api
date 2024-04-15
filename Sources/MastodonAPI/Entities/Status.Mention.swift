import Foundation

extension Entities.Status {
    public struct Mention: Codable, Sendable {
        public let acct: String
        public let id: String
        public let url: URL
        public let username: String

        private enum CodingKeys: String, CodingKey {
            case acct
            case id
            case url
            case username
        }
    }
}
