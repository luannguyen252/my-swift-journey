//
//  MovieDetailsStore.swift
//  Movie-DBTests
//
//  Created by Vidhyadharan on 26/12/20.
//

import UIKit
import Combine
@testable import Movie_DB_SwiftUI

class MockMovieDetailsStore: MovieDetailsStoreProtocol {
    let movieDetailsSubject = PassthroughSubject<MovieDetailsStoreResult, Error>()
        
    var movieDetailsStoreResult: MovieDetailsStoreResult = MovieDetailsStoreResult(dataType: .noData, movieDetails: nil, error: nil)
    
    func getMovieDetails(id: String) {
        movieDetailsSubject.send(movieDetailsStoreResult)
    }
}
