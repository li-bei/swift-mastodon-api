public enum MastodonAPIError: Error {
    case badRequest(Request)
    case unknown(Int, String)
}
