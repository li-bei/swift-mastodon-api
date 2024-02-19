import Foundation

extension Entities.Status {
    public struct Application: Codable, Sendable {
        public let name: String
        public let website: String?
    }
}
