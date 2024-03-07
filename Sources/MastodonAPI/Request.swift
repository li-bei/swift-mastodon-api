import Foundation
import HTTPTypes

public struct Request: Sendable {
    public var method: HTTPRequest.Method

    public var path: String

    public var headerFields: HTTPFields = [:]

    public var bodyData: Data?
}

// MARK: -

extension Request {
    public static func post(_ endpoint: String) -> Request {
        return Request(method: .post, path: endpoint)
    }

    public static func post(_ endpoint: String, parameters: Encodable) throws -> Request {
        let headerFields: HTTPFields = [.contentType: "application/json"]
        let bodyData = try JSONEncoder().encode(parameters)
        return Request(method: .post, path: endpoint, headerFields: headerFields, bodyData: bodyData)
    }
}
