//
//  NSManagedObjectContext+StubData.swift
//  Movie-DB-SwiftUI
//
//  Created by Vidhyadharan on 29/12/20.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    @discardableResult func insertMovie() -> Movie {
        let movie = Movie(context: self)
        
        movie.id = NSUUID().uuidString
        movie.overview = "overview"
        movie.posterPath = "/lNVHB85FUDZqLzvug3k6FA07RIr.jpg"
        movie.title = "title"
        movie.popularity = 300.00
        
        return movie
    }
    
    func insertStubMovies(count: Int) {
        var movieCount = count
        
        while movieCount > 0 {
            insertMovie()
            movieCount = movieCount - 1
        }
    }
    
}
