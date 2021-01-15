//
//  NetworkService.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation
import Combine

class NetworkService: ObservableObject {
    enum NetworkError: Error, LocalizedError {
        case badData
        case badURL
        case unauthorized
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .unauthorized:
                return "error_unauthorized"
            default:
                return "error_unknown"
            }
        }
    }
    
    private let baseURL = URL(string: "https://dev.to/api")!
    private let auth: AuthService
    private let decoder: JSONDecoder
    private let session: URLSession
    
    init(auth: AuthService, decoder: JSONDecoder = JSONDecoder(), session: URLSession = .shared) {
        self.auth = auth
        self.decoder = decoder
        self.session = session
        
        self.decoder.dateDecodingStrategy = .formatted(.iso8601Full)
    }
    
    func getArticles(page: Int = 1) -> AnyPublisher<[Article], NetworkError> {
        guard let apiKey = auth.apiKey else {
            return Fail(error: NetworkError.unauthorized)
                .eraseToAnyPublisher()
        }
        
        var components = URLComponents(string: baseURL.absoluteString)!
        components.path.append("/articles/me/published")
        components.queryItems = [
            URLQueryItem(name: "page", value: String(describing: page)),
            URLQueryItem(name: "per_page", value: String(describing: Settings.articlesPerPage))
        ]
        
        var request = URLRequest(url: components.url!)
        request.addValue(apiKey, forHTTPHeaderField: "api-key")
        
        return session.dataTaskPublisher(for: request)
            .tryMap({ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse else {
                    throw NetworkError.unknown
                }
                
                switch response.statusCode {
                case 200:
                    return data
                case 401:
                    throw NetworkError.unauthorized
                default:
                    throw NetworkError.unknown
                }
            })
            .decode(type: [Article].self, decoder: decoder)
            .mapError({ error in
                switch error {
                case is DecodingError:
                    return .badData
                case is NetworkError:
                    return error as! NetworkError
                default:
                    return .unknown
                }
            })
            .eraseToAnyPublisher()
    }
    
    func getFollowers(page: Int = 1) -> AnyPublisher<[Follower], NetworkError> {
        guard let apiKey = auth.apiKey else {
            return Fail(error: NetworkError.unauthorized)
                .eraseToAnyPublisher()
        }
        
        var components = URLComponents(string: baseURL.absoluteString)!
        components.path.append("/followers/users")
        components.queryItems = [
            URLQueryItem(name: "page", value: String(describing: page)),
            URLQueryItem(name: "per_page", value: String(describing: Settings.followersPerPage))
        ]
        
        var request = URLRequest(url: components.url!)
        request.addValue(apiKey, forHTTPHeaderField: "api-key")
        
        return session.dataTaskPublisher(for: request)
            .tryMap({ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse else {
                    throw NetworkError.unknown
                }
                
                switch response.statusCode {
                case 200:
                    return data
                case 401:
                    throw NetworkError.unauthorized
                default:
                    throw NetworkError.unknown
                }
            })
            .decode(type: [Follower].self, decoder: decoder)
            .mapError({ error in
                switch error {
                case is DecodingError:
                    return .badData
                case is NetworkError:
                    return error as! NetworkError
                default:
                    return .unknown
                }
            })
            .eraseToAnyPublisher()
    }
    
    func getProfile() -> AnyPublisher<Profile, NetworkError> {
        guard let apiKey = auth.apiKey else {
            return Fail(error: NetworkError.unauthorized)
                .eraseToAnyPublisher()
        }
        
        var components = URLComponents(string: baseURL.absoluteString)!
        components.path.append("/users/me")
        
        var request = URLRequest(url: components.url!)
        request.addValue(apiKey, forHTTPHeaderField: "api-key")
        
        return session.dataTaskPublisher(for: request)
            .tryMap({ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse else {
                    throw NetworkError.unknown
                }
                
                switch response.statusCode {
                case 200:
                    return data
                case 401:
                    throw NetworkError.unauthorized
                default:
                    throw NetworkError.unknown
                }
            })
            .decode(type: Profile.self, decoder: decoder)
            .mapError({ error in
                switch error {
                case is DecodingError:
                    return .badData
                case is NetworkError:
                    return error as! NetworkError
                default:
                    return .unknown
                }
            })
            .eraseToAnyPublisher()
    }
}

