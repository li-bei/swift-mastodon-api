import Foundation

extension Entities {
    public struct Marker: Codable, Sendable {
        public let lastReadID: String
        public let updateDate: Date
        public let version: Int64

        private enum CodingKeys: String, CodingKey {
            case lastReadID = "last_read_id"
            case updateDate = "updated_at"
            case version
        }
    }
}
