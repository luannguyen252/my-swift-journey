//
//  Endpoints.swift
//  Movie-DB
//
//  Created by Vidhyadharan on 23/12/20.
//

import Foundation

protocol EndPoint {
    func urlRequest() -> URLRequest
}

struct Endpoints {
    
    private init() {}
    
    struct Movies: EndPoint {
        private var path: String { "movie" }
        
        enum Category: String {
            case upcoming
            case top_rated
            case popular
            case now_playing
        }
        
        let page: Int
        let category: Category
        
        init(page: Int = 1, category: Category) {
            self.page = page
            self.category = category
        }
        
        func urlRequest() -> URLRequest {
            return URLRequest(httpMethod: .GET, path: "\(path)/\(category.rawValue)", queries: ["page": page])
        }
    }
    
    struct MovieDetails: EndPoint {
        private var path: String { "movie" }
        
        let movieId: String
                
        func urlRequest() -> URLRequest {
            return URLRequest(httpMethod: .GET, path: "\(path)/\(movieId)")
        }
    }

}
