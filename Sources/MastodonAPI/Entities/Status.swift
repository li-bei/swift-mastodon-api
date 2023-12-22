import Foundation

extension Entities {
    public final class Status: Codable, Sendable {
        public let account: Account
        public let content: String
        public let favoriteCount: Int
        public let id: String
        public let isBookmarked: Bool
        public let isFavorited: Bool
        public let isReblogged: Bool
        public let reblog: Status?
        public let reblogCount: Int
        public let url: URL?
        
        private enum CodingKeys: String, CodingKey {
            case account
            case content
            case favoriteCount = "favourites_count"
            case id
            case isBookmarked = "bookmarked"
            case isFavorited = "favourited"
            case isReblogged = "reblogged"
            case reblog
            case reblogCount = "reblogs_count"
            case url
        }
    }
}
