//
//  Network.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidURL
}


class ApiRequset {
    
    enum Api {
        case nowPlaying
        case topRated
    }
    
    static let shared = ApiRequset()
    private init () { }
    
    func make(_ request: String,handler: @escaping (Data? , URLResponse?, Error?) -> () ){
        guard let url = URL(string: request) else { return }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        session.dataTask(with: request) { handler($0,$1,$2) }.resume()
    }
}
