import Foundation
import HTTPTypes

public struct Request<Response: Decodable>: Sendable {
    public var method: HTTPRequest.Method
    
    public var path: String
    
    public var headerFields: HTTPFields
    
    public var body: Data?
    
    public init(method: HTTPRequest.Method, path: String, headerFields: HTTPFields = [:], body: Data? = nil) {
        self.method = method
        self.path = path
        self.headerFields = headerFields
        self.body = body
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
    
    public static func post(_ endpoint: String, parameters: Encodable) throws -> Request {
        let body = try JSONEncoder().encode(parameters)
        return Request(method: .post, path: endpoint, headerFields: [.contentType: "application/json"], body: body)
    }
}
