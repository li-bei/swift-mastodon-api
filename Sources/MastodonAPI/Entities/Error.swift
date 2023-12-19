extension Entities {
    public struct Error: Codable, Swift.Error {
        public let error: String
        public let errorDescription: String?
        
        private enum CodingKeys: String, CodingKey {
            case error
            case errorDescription = "error_description"
        }
    }
}
