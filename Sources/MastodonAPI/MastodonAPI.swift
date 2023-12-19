import Foundation
import HTTPTypes
import HTTPTypesFoundation

public struct MastodonAPI {
    private let serverURL: URL
    
    private let accessToken: String?
    
    private let session: URLSession
    
    public init(serverURL: URL, accessToken: String? = nil, session: URLSession = .shared) {
        self.serverURL = serverURL
        self.accessToken = accessToken
        self.session = session
    }
    
    public func response<Response>(for request: Request<Response>) async throws -> Response {
        var urlComponents = URLComponents()
        urlComponents.path = request.path
        guard let url = urlComponents.url(relativeTo: serverURL) else {
            fatalError()
        }
        
        var httpRequest = HTTPRequest(method: request.method, url: url, headerFields: request.headerFields)
        if let accessToken {
            httpRequest.headerFields[.authorization] = "Bearer \(accessToken)"
        }
        
        let (data, httpResponse) = try await {
            if let body = request.body {
                try await session.upload(for: httpRequest, from: body)
            } else {
                try await session.data(for: httpRequest)
            }
        }()
        
        switch httpResponse.status.kind {
        case .successful:
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response
        default:
            fatalError()
        }
    }
}
