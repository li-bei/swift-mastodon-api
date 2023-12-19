import Foundation

public struct MastodonAPI {
    private let serverURL: URL
    
    private let accessToken: String?
    
    public init(serverURL: URL, accessToken: String? = nil) {
        self.serverURL = serverURL
        self.accessToken = accessToken
    }
}
