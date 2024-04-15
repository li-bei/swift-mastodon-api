import Foundation

extension Entities {
    public struct CustomEmoji: Codable, Sendable {
        public let category: String?
        public let isVsibleInPicker: Bool
        public let shortcode: String
        public let staticURL: URL
        public let url: URL

        private enum CodingKeys: String, CodingKey {
            case category
            case isVsibleInPicker = "visible_in_picker"
            case shortcode
            case staticURL = "static_url"
            case url
        }
    }
}
