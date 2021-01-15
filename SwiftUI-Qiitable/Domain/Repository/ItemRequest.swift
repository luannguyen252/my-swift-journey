import Foundation

public struct ItemRequest: RequestType, Equatable {
    public var endpoint: Endpoint {
        return .items
    }

    public var needsAuth: Bool {
        return false
    }

    public func makeURLRequest() -> URLRequest {
        var components = URLComponents(string: endpoint.urlString)
        components?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "per_page", value: "20")
        ]

        if let query = query {
            components?.queryItems?.append(URLQueryItem(name: "query", value: query))
        }

        guard let url = components?.url else { fatalError() }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        return request
    }

    private let page: Int
    private let query: String?
    public init(page: Int, query: String?) {
        self.page = page
        self.query = query
    }
}
