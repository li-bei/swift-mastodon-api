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
    
    public func response<Response: Decodable>(_: Response.Type, for request: Request) async throws -> Response {
        var urlComponents = URLComponents()
        urlComponents.path = request.path
        guard let url = urlComponents.url(relativeTo: serverURL) else {
            let error = MastodonAPIError.badRequest(request)
            throw error
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
        case .clientError:
            let error = try JSONDecoder().decode(Entities.Error.self, from: data)
            throw error
        default:
            let error = MastodonAPIError.unknown(httpResponse.status.code, String(decoding: data, as: UTF8.self))
            throw error
        }
    }
}
