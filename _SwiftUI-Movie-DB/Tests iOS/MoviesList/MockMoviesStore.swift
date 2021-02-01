//
//  MockMoviesStore.swift
//  Movie-DBTests
//
//  Created by Vidhyadharan on 26/12/20.
//

import UIKit
import Combine
@testable import Movie_DB_SwiftUI

class MockMoviesStore: MoviesStoreProtocol {
    let moviesResponseSubject = PassthroughSubject<MoviesStoreResult, Error>()
        
    var cachedMoviesCount = 0
    var moviesStoreResult: MoviesStoreResult = MoviesStoreResult(dataType: .noData, error: nil)
        
    func getPersistedMoviesCount() -> Int {
        return self.cachedMoviesCount
    }
    
    func getMovies(category: Endpoints.Movies.Category) {
        moviesResponseSubject.send(moviesStoreResult)
    }

}
