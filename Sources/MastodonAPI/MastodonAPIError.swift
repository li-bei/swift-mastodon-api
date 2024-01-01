public struct MastodonAPIError: Error {
    public let request: Request
    public let httpStatusCode: Int?
    public let httpResponseBody: String?
    
    init(request: Request, httpStatusCode: Int? = nil, httpResponseBody: String? = nil) {
        self.request = request
        self.httpStatusCode = httpStatusCode
        self.httpResponseBody = httpResponseBody
    }
}
