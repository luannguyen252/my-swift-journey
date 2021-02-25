//
//  Movie.swift
//  MovieTracker
//
//  Created by zappycode on 6/18/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI
import Combine

struct Movie : Identifiable {
    var id: UUID = UUID()
    var title: String = ""
    var rating: Double = 3.0
    var seen: Bool = false
}

class MovieStore : BindableObject {
    let didChange = PassthroughSubject<Void, Never>()
    
    var movies: [Movie] {
        didSet {
            didChange.send()
        }
    }
    
    init() {
        var movie1 = Movie()
        movie1.title = "Sandlot"
        var movie2 = Movie()
        movie2.title = "The Matrx"
        movie2.seen = true
        movies = [movie1,movie2]
    }
    
    func addMovie(movie: Movie) {
        movies.append(movie)
    }
}
