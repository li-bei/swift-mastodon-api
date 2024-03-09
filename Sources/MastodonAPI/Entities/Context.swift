extension Entities {
    public struct Context: Codable, Sendable {
        public let ancestors: [Status]
        public let descendants: [Status]
    }
}
