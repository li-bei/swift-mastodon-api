import Foundation

extension Entities {
    public struct MediaAttachment: Codable, Sendable {
        public let description: String?
        public let id: String
        public let previewURL: URL?
        public let remoteURL: URL?
        public let type: String
        public let url: URL

        private enum CodingKeys: String, CodingKey {
            case description
            case id
            case previewURL = "preview_url"
            case remoteURL = "remote_url"
            case type
            case url
        }
    }
}
