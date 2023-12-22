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
        return try await paginatedResponse(Response.self, for: request).0
    }
    
    public func paginatedResponse<Response: Decodable>(
        _: Response.Type,
        for request: Request
    ) async throws -> (Response, String?) {
        var urlComponents = URLComponents()
        urlComponents.path = request.path
        if let queryItems = request.queryItems?.filter({ $0.value != nil }), queryItems.isEmpty == false {
            urlComponents.queryItems = queryItems
        }
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
            let response = try makeJSONDecoder().decode(Response.self, from: data)
            let paginationID = paginationID(from: httpResponse)
            return (response, paginationID)
        case .clientError:
            let error = try JSONDecoder().decode(Entities.Error.self, from: data)
            throw error
        default:
            let error = MastodonAPIError.unknown(httpResponse.status.code, String(decoding: data, as: UTF8.self))
            throw error
        }
    }
    
    private static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    private func makeJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let date = Self.iso8601DateFormatter.date(from: string) {
                return date
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Expected date string to be ISO8601-formatted."
                )
            }
        }
        return decoder
    }
    
    private func paginationID(from httpResponse: HTTPResponse) -> String? {
        guard let links = httpResponse.headerFields[HTTPField.Name("Link")!] else { return nil }
        for link in links.components(separatedBy: ", ") {
            let components = link.components(separatedBy: "; ")
            if components.count == 2,
               components[1] == #"rel="next""#,
               let urlComponents = URLComponents(string: String(components[0].dropFirst().dropLast())) {
                return urlComponents.queryItems?.first(where: { $0.name == "max_id" || $0.name == "offset" })?.value
            }
        }
        return nil
    }
}
