import Foundation

extension Entities.Status {
    public struct Mention: Codable, Sendable {
        public let acct: String
        public let id: String
        public let url: URL
        public let username: String
    }
}
