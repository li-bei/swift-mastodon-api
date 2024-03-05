extension Entities.MediaAttachment {
    public struct Meta: Codable, Sendable {
        public struct Original: Codable, Sendable {
            public let width: Double?
            public let height: Double?
        }
        
        public let original: Original
    }
}
