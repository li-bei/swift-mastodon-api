import Foundation
import HTTPTypes
import HTTPTypesFoundation

public struct MastodonAPI: Sendable {
    private let serverURL: URL

    private let session: URLSession

    public init(serverURL: URL, session: URLSession = .shared) {
        self.serverURL = serverURL
        self.session = session
    }

    public func response<Response: Decodable>(_: Response.Type, for request: Request) async throws -> Response {
        var urlComponents = URLComponents()
        urlComponents.path = request.path
        guard let url = urlComponents.url(relativeTo: serverURL) else {
            throw MastodonAPIError(request: request)
        }

        let httpRequest = HTTPRequest(method: request.method, url: url, headerFields: request.headerFields)

        let (data, httpResponse) = if let body = request.body {
            try await session.upload(for: httpRequest, from: body)
        } else {
            try await session.data(for: httpRequest)
        }

        switch httpResponse.status.kind {
        case .successful:
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response
        default:
            if let error = try? JSONDecoder().decode(Entities.Error.self, from: data) {
                throw error
            } else {
                throw MastodonAPIError(request: request)
            }
        }
    }
}
