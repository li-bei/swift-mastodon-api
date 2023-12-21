import Foundation

extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let id: String
        public let isBookmarked: Bool
        public let isFavorited: Bool
        public let isReblogged: Bool
        public let reblog: Status?
        public let url: URL?
        
        private enum CodingKeys: String, CodingKey {
            case account
            case id
            case isBookmarked = "bookmarked"
            case isFavorited = "favourited"
            case isReblogged = "reblogged"
            case reblog
            case url
        }
    }
}
