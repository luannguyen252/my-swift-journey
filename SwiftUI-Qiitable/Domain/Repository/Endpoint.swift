import Foundation

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

public enum Endpoint {
    case items

    public var urlString: String {
        switch self {
        case .items:
            return "https://qiita.com/api/v2/items"
        }
    }

    public var url: URL {
        return URL(string: urlString)!
    }
}

public protocol RequestType {
    var endpoint: Endpoint { get }
    var needsAuth: Bool { get }
    func makeURLRequest() -> URLRequest
}
