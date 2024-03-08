import Foundation
import HTTPTypes

public struct Request: Sendable {
    public var method: HTTPRequest.Method

    public var path: String

    public var queryItems: [URLQueryItem]?

    public var headerFields: HTTPFields = [:]

    public var bodyData: Data?
}

// MARK: -

extension Request {
    public static func get(_ endpoint: String) -> Request {
        return Request(method: .get, path: endpoint)
    }

    public static func get(_ endpoint: String, parameters: [String: String?]) -> Request {
        let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return Request(method: .get, path: endpoint, queryItems: queryItems)
    }

    public static func post(_ endpoint: String) -> Request {
        return Request(method: .post, path: endpoint)
    }

    public static func post(_ endpoint: String, parameters: Encodable) throws -> Request {
        let headerFields: HTTPFields = [.contentType: "application/json"]
        let bodyData = try JSONEncoder().encode(parameters)
        return Request(method: .post, path: endpoint, headerFields: headerFields, bodyData: bodyData)
    }
}
