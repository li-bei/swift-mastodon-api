import Foundation
import HTTPTypes

public struct Request: Sendable {
    public var method: HTTPRequest.Method
    public var path: String
    public var headerFields: HTTPFields = [:]
    public var body: Data?
}
