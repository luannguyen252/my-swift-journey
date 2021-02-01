//
//  File.swift
//  Movie-DB
//
//  Created by Vidhyadharan on 26/12/20.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case UPDATE
    case DELETE
}

extension URLRequest {
    init(httpMethod: HTTPMethod, path: String, queries: [String: Any] = [:]) {
        
        var urlQueryItems = [URLQueryItem(name: "api_key", value: Constants.API.apiKey)]
        
        for query in queries {
            urlQueryItems.append(URLQueryItem(name: query.key, value: "\(query.value)"))
        }

        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.API.baseUrl
        components.path = "/\(Constants.API.version)/\(path)"
        components.queryItems = urlQueryItems
        let url = components.url!
        
        print("url \(url)")
        self.init(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        self.httpMethod = httpMethod.rawValue
    }
}
