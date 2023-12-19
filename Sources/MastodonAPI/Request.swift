import HTTPTypes

public struct Request<Response: Decodable>: Sendable {
    public var method: HTTPRequest.Method
    
    public var path: String
    
    public init(method: HTTPRequest.Method, path: String) {
        self.method = method
        self.path = path
    }
}

// MARK: -

extension Request {
    public static func get(_ endpoint: String) -> Request {
        return Request(method: .get, path: endpoint)
    }
    
    public static func post(_ endpoint: String) -> Request {
        return Request(method: .post, path: endpoint)
    }
}
