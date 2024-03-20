import Foundation

public struct MastodonAPI {
    private let serverURL: URL

    public init(serverURL: URL) {
        self.serverURL = serverURL
    }
}
