import Foundation
import HTTPTypes

public struct MastodonAPIError: Error {
    public let request: Request
    public let data: Data?
    public let httpResponse: HTTPResponse?
}
