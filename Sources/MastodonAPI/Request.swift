import Foundation
import HTTPTypes

public struct Request: Sendable {
    public var method: HTTPRequest.Method
    public var path: String
    public var headerFields: HTTPFields = [:]
    public var body: Data?
}

// MARK: -

extension Request {
    public static func get(_ endpoint: String) -> Request {
        return Request(method: .get, path: endpoint)
    }

    public static func post(_ endpoint: String, parameters: Encodable) throws -> Request {
        let body = try JSONEncoder().encode(parameters)
        return Request(method: .post, path: endpoint, headerFields: [.contentType: "application/json"], body: body)
    }
}
