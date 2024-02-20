import Foundation

extension Entities.Tag {
    public struct History: Codable, Sendable {
        public let day: String
        public let uses: String
        public let accounts: String
    }
}
