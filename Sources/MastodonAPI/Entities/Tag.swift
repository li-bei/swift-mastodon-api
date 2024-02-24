import Foundation

extension Entities {
    public struct Tag: Codable, Sendable {
        public let history: [History]
        public let isFollowing: Bool?
        public let name: String
        public let url: URL
        
        private enum CodingKeys: String, CodingKey {
            case history
            case isFollowing = "following"
            case name
            case url
        }
    }
}
