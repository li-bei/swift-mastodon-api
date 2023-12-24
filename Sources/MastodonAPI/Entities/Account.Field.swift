import Foundation

extension Entities.Account {
    public struct Field: Codable, Sendable {
        public let name: String
        public let value: String
        public let verificationDate: Date?
        
        private enum CodingKeys: String, CodingKey {
            case name
            case value
            case verificationDate = "verified_at"
        }
    }
}
