//
//  NetworkManager.swift
//  Movie-DB
//
//  Created by Vidhyadharan on 23/12/20.
//

import Foundation
import CoreData
import Reachability
import Combine

enum NetworkManagerError: Error {
    case networkFailureError(String)
    case apiErrorResponse([String: Any])
    case decodeError(String)
}

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

protocol NetworkManagerProtocol {
//    func apiDataTask<T: Codable>(endpoint: EndPoint,
//                     decoder: JSONDecoder,
//                     completion: @escaping (Result<T?, NetworkManagerError>) -> Void)
    
    func apiDataTask<T: Codable>(endpoint: EndPoint,
                                 decoder: JSONDecoder) -> AnyPublisher<T?, NetworkManagerError>
}

class NetworkManager: NetworkManagerProtocol {
    
    static let sharedInstance = NetworkManager()
    
    private let reachability = try! Reachability()
    
    private let backgroundQueue = DispatchQueue(label: "NetworkRequest.queue", qos: .background)
    
    private init() {

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
    }
    
    deinit {
        reachability.stopNotifier()
    }
    
    fileprivate var sessionConfig: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return config
    }()

    internal lazy var session: URLSession = {
        let session: URLSession = URLSession(configuration: sessionConfig)
        return session
    }()

    func apiDataTask<T: Codable>(endpoint: EndPoint,
                     decoder: JSONDecoder,
                     completion: @escaping (Result<T?, NetworkManagerError>) -> Void) {

        let dataTask: URLSessionDataTask = session.dataTask(with: endpoint.urlRequest()) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkManagerError.networkFailureError(error!.localizedDescription)))
                }
                return
            }
                        
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 204 else {
                DispatchQueue.main.async {
                    completion(.success(nil))
                }
                return
            }
            
            var jsonDecodeError: Error
            do {
                let obj = try decoder.decode(T.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(obj))
                }
            } catch (let decodeError) {
                do {
                    if let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                        DispatchQueue.main.async {
                            completion(.failure(NetworkManagerError.apiErrorResponse(dictionary)))
                        }
                        return
                    }
                    jsonDecodeError = decodeError
                } catch let jsonError {
                    jsonDecodeError = jsonError
                }
                
                DispatchQueue.main.async {
                    completion(.failure(NetworkManagerError.decodeError(jsonDecodeError.localizedDescription)))
                }
            }
        }
        
        dataTask.resume()
    }

    func apiDataTask<T: Codable>(endpoint: EndPoint,
                                 decoder: JSONDecoder) -> AnyPublisher<T?, NetworkManagerError> {
        URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest())
            .tryMap({ (apiResponse) -> T? in
                guard let httpResponse = apiResponse.response as? HTTPURLResponse, httpResponse.statusCode != 204 else {
                    return nil
                }
                
                do {
                    return try decoder.decode(T.self, from: apiResponse.data)
                } catch (let error) {
                    if let dictionary = try JSONSerialization.jsonObject(with: apiResponse.data, options: .mutableContainers) as? [String: Any] {
                        throw NetworkManagerError.apiErrorResponse(dictionary)
                    }
                    throw NetworkManagerError.decodeError(error.localizedDescription)
                }
            })
            .mapError {
                NetworkManagerError.networkFailureError($0.localizedDescription)
            }
            .subscribe(on: self.backgroundQueue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
