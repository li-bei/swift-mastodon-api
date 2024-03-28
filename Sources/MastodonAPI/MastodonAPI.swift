import Foundation
import HTTPTypes
import HTTPTypesFoundation

public struct MastodonAPI: Sendable {
    private let serverURL: URL

    private let accessToken: String?

    private let session: URLSession

    public init(serverURL: URL, accessToken: String? = nil, session: URLSession = .shared) {
        self.serverURL = serverURL
        self.accessToken = accessToken
        self.session = session
    }

    public func response<Response: Decodable>(
        _ responseType: Response.Type,
        for request: Request
    ) async throws -> Response {
        return try await paginatedResponse(responseType, for: request).0
    }

    public func paginatedResponse<Response: Decodable>(
        _ responseType: Response.Type,
        for request: Request
    ) async throws -> (Response, String? ) {
        var urlComponents = URLComponents()
        urlComponents.path = request.path
        if let queryItems = request.queryItems?.filter({ $0.value != nil }), queryItems.isEmpty == false {
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url(relativeTo: serverURL) else {
            throw MastodonAPIError(request: request)
        }

        var httpRequest = HTTPRequest(method: request.method, url: url, headerFields: request.headerFields)
        if let accessToken {
            httpRequest.headerFields[.authorization] = "Bearer \(accessToken)"
        }

        let (data, httpResponse) = if let body = request.body {
            try await session.upload(for: httpRequest, from: body)
        } else {
            try await session.data(for: httpRequest)
        }

        switch httpResponse.status.kind {
        case .successful:
            let response = try JSONDecoder().decode(Response.self, from: data)
            let paginationID = paginationID(from: httpResponse)
            return (response, paginationID)
        default:
            if let error = try? JSONDecoder().decode(Entities.Error.self, from: data) {
                throw error
            } else {
                throw MastodonAPIError(request: request)
            }
        }
    }

    private func paginationID(from httpResponse: HTTPResponse) -> String? {
        guard let links = httpResponse.headerFields[HTTPField.Name("Link")!] else { return nil }
        for link in links.components(separatedBy: ", ") {
            let components = link.components(separatedBy: "; ")
            if components.count == 2, components[1] == #"rel="next""#,
               let urlComponents = URLComponents(string: String(components[0].dropFirst().dropLast())),
               let queryItems = urlComponents.queryItems,
               let paginationID = queryItems.first(where: { $0.name == "max_id" })?.value {
                return paginationID
            }
        }
        return nil
    }
}
