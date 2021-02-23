//
//  Utils.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import Foundation

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    static let genreIDValues : [Int : String] = [
        
        28 : "Action",
        16 : "Animated",
        99 : "Documentary",
        18 : "Drama",
        10751 : "Family",
        14 : "Fantasy",
        36 : "History",
        35 : "Comedy",
        10752 : "War",
        80 : "Crime",
        10402 : "Music",
        9648 : "Mystery",
        10749 : "Romance",
        878 : "Sci-Fi",
        27 : "Horror",
        10770 : "TV Movie",
        53 : "Thriller",
        37 : "Western",
        12 : "Adventure"
        
    ]
    
    static let urlForImage = "https://image.tmdb.org/t/p/w500"
}
