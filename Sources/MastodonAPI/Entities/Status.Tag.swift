import Foundation

extension Entities.Status {
    public struct Tag: Codable, Sendable {
        public let name: String
        public let url: URL
    }
}
