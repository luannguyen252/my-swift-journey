//
//  WebAPI.Endpoint.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation


protocol WebAPIEndpoint {
    
    func asURL() throws -> URL
}


extension WebAPI {
    
    enum GiphyEndpoint: WebAPIEndpoint {
        
        // MARK: Constants
        
        private struct Constants {
            static let apiKey = "d2NL3UTnAYucBX4SOITKjK6KkqCtzX9U"
            static let scheme = "https"
            static let host = "api.giphy.com"
            static let basePath = "/v1/gifs/"
        }
        
        
        // MARK: Cases
        
        case trending(Int, Int)
        case random
        
        
        // MARK: Properties
        
        private var path: String {
            switch self {
            case .random:
                return "random"
            case let .trending(limit, offset):
                return "trending?offset=\(offset)&limit=\(limit)"
            }
        }
        
        
        // MARK: Public functions
        
        func asURL() throws -> URL {
            var urlComponents = URLComponents()
            urlComponents.scheme = Constants.scheme
            urlComponents.host = Constants.host
            urlComponents.path = "\(Constants.basePath)\(path.components(separatedBy: "?").first!)"
            var queryParams: [(String, String)] = []
            let queryParamsString = path.components(separatedBy: "?")
            if queryParamsString.count == 2 {
                queryParams = queryParamsString.last?.components(separatedBy: "&").map { query -> (String, String) in
                    let components = query.components(separatedBy: "=")
                    return (components[0], components[1])
                } ?? []
            }
            queryParams.append(("api_key", Constants.apiKey))
            urlComponents.query = queryParams.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
            
            guard let url = urlComponents.url else {
                throw URLError(.badURL)
            }
            return url
        }
        
    }
    
}
