import HTTPTypes

public enum MastodonAPIError: Error {
    case badRequest(Request)
    case unsuccessfulHTTPResponse(HTTPResponse)
}
