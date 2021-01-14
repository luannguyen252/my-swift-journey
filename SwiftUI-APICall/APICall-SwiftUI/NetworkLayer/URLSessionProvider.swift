//
//  URLSessionProvider.swift
//  Webservice
//
//  Created by Apple on 20/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import UIKit

class URLSessionProvider: RequestProviderProtocol {
    
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    /// Making the api request
    func request<T>(type: T.Type, service: RequestProtocol, completion: @escaping ((Result<T,NetworkError>) -> Void)) where T: Decodable {
        let request = URLRequest(service: service)
        /// Uncomment the next line to print the request details
        //NetworkLogger.log(request: request)
        
        let task = session.dataTask(request: request) { [weak self] (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            self?.parseData(data: data, response: httpResponse, error: error, completion: completion)
        }
        task.resume()
    }
    
    /// Parse the JSON response & returns result for the particular request
    private func parseData<T: Decodable>(data: Data?, response: HTTPURLResponse?,error: Error?, completion: ((Result<T,NetworkError>) -> Void)) {
        guard error == nil else { return completion(.failure(.failed)) }
        guard let httpResponse = response else { return completion(.failure(.noJSONData)) }
        
        let decoder = JSONDecoder.init()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        switch httpResponse.statusCode {
        case 200..<300:
            /// Uncomment the next line to print the response details
            NetworkLogger.log(response: response, responseData: data)
            guard let data = data, let model = try? decoder.decode(T.self, from: data) else {
                return completion(.failure(.noJSONData))
            }
            completion(.success(model))
        case 401:
            return completion(.failure(.authenticationError))
        case 400...499:
            return completion(.failure(.badRequest))
        case 500...599:
            return completion(.failure(.serverSideError))
        default:
            return completion(.failure(.failed))
        }
    }
}
