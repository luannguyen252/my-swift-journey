import Foundation
import Combine

/// @mockable
protocol Connection {
    var session: URLSession { get }
    func call<T, V>(request: T) -> AnyPublisher<V, Error> where T: RequestType, V: Codable
}

final class ConnectionImpl: Connection {
    var session: URLSession
    private let retryCount: Int = 1
    private let successRange = 200 ..< 300
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    init(session: URLSession) {
        self.session = session
    }

    func call<T, V>(request: T) -> AnyPublisher<V, Error> where T: RequestType, V: Codable {
        return session
            .dataTaskPublisher(for: request.makeURLRequest())
            .validateNetwork()
            .validate(statusCode: successRange)
            .retry(retryCount)
            .map { $0.data }
            .decode(type: V.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
