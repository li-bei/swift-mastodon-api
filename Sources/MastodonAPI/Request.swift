import Foundation
import HTTPTypes

public struct Request: Sendable {
    public var method: HTTPRequest.Method
    public var path: String
    public var queryItems: [URLQueryItem]?
    public var headerFields: HTTPFields = [:]
    public var body: Data?
}

// MARK: -

extension Request {
    public static func delete(_ endpoint: String) -> Request {
        return Request(method: .delete, path: endpoint)
    }

    public static func get(_ endpoint: String) -> Request {
        return Request(method: .get, path: endpoint)
    }

    public static func get(_ endpoint: String, parameters: [String: String?]) -> Request {
        let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return Request(method: .get, path: endpoint, queryItems: queryItems)
    }

    public static func get(_ endpoint: String, parameters: [(String, String?)]) -> Request {
        let queryItems = parameters.map { URLQueryItem(name: $0.0, value: $0.1) }
        return Request(method: .get, path: endpoint, queryItems: queryItems)
    }

    public static func post(_ endpoint: String) -> Request {
        return Request(method: .post, path: endpoint)
    }

    public static func post(_ endpoint: String, parameters: Encodable) throws -> Request {
        let body = try JSONEncoder().encode(parameters)
        return Request(method: .post, path: endpoint, headerFields: [.contentType: "application/json"], body: body)
    }
}
