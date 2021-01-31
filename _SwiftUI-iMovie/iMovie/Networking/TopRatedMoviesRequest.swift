//
//  TopRatedMoviesRequest.swift
//  iMovie
//
//  Created by Sandesh on 12/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

struct TopRatedMovieRequest {
    static func make(_ handler: @escaping ([Movie]) -> ()) {
        let urlString  = NetworkConstants.baseURL + "top_rated" + NetworkConstants.apiKeyString
        print(urlString)
        ApiRequset.shared.make(urlString) { data, response, error in
            if data != nil {
                let jsonDecoder = JSONDecoder()
                do {
                    let movies = try jsonDecoder.decode(NowPlaying.self, from: data!)
                    handler(movies.results)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
