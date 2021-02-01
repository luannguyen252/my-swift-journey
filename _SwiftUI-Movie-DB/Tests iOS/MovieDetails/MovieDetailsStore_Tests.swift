//
//  MovieDetailsStore_Tests.swift
//  Movie-DBTests
//
//  Created by Vidhyadharan on 23/12/20.
//

import XCTest
import CoreData
import Combine
@testable import Movie_DB_SwiftUI

class MovieDetailsStore_Tests: XCTestCase {

    var coreDataStack: PersistenceController!
    var mockNetworkManager: MockNetworkManager!
    var movieDetailsStore: MovieDetailsStore!
    var cancellableSet: Set<AnyCancellable>!

    override func setUpWithError() throws {
        coreDataStack = PersistenceController(inMemory: true)
        mockNetworkManager = MockNetworkManager()
        movieDetailsStore = MovieDetailsStore(coreDataStack: coreDataStack, networkManager: mockNetworkManager)
        cancellableSet = []
    }

    override func tearDownWithError() throws {
        coreDataStack = nil
        mockNetworkManager = nil
        movieDetailsStore = nil
    }

    func test_noNetwork_noCachedData_error() throws {
        mockNetworkManager.failureError = NetworkManagerError.networkFailureError("Network Error")
        let id = "345678"

        let expt = expectation(description: "Should fail on network error")
        
        movieDetailsStore
            .movieDetailsSubject
            .sink { (_) in
            } receiveValue: { (movieDetailsStoreResult) in
                guard let _ = movieDetailsStoreResult.error, movieDetailsStoreResult.dataType == .noData else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        movieDetailsStore.getMovieDetails(id: id)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_noNetwork_cachedData_error() throws {
        mockNetworkManager.failureError = NetworkManagerError.networkFailureError("Network Error")

        let id = "345678"
        try insertStubMovieDetails(id: id, shouldSave: true)

        let expt = expectation(description: "Should fail on network error")
        
        movieDetailsStore
            .movieDetailsSubject
            .sink { (_) in
            } receiveValue: { (movieDetailsStoreResult) in
                guard let _ = movieDetailsStoreResult.error, movieDetailsStoreResult.dataType == .cached else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        movieDetailsStore.getMovieDetails(id: id)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_validNetwork_invalidMovieId_error() throws {
        mockNetworkManager.failureError = NetworkManagerError.apiErrorResponse(["status_code" : 34])

        let id = "345678"

        let expt = expectation(description: "Should fail on due to invalid movie id")
        
        movieDetailsStore
            .movieDetailsSubject
            .sink { (_) in
            } receiveValue: { (movieDetailsStoreResult) in
                guard let _ = movieDetailsStoreResult.error, movieDetailsStoreResult.dataType == .inValid else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        movieDetailsStore.getMovieDetails(id: id)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_validNetwork_liveData_noError() throws {
        let movieDetails = try insertStubMovieDetails()
        mockNetworkManager.successObject = movieDetails

        let expt = expectation(description: "Should return data type as live")
        
        movieDetailsStore
            .movieDetailsSubject
            .sink { (_) in
            } receiveValue: { (movieDetailsStoreResult) in
                guard movieDetailsStoreResult.error == nil, movieDetailsStoreResult.dataType == .live else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        movieDetailsStore.getMovieDetails(id: movieDetails.id!)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func test_validNetwork_validMovie_movieDetails_Relationship() throws {
        let id = "434354"
        let movie = try insertStubMovie(id: id)
        let movieDetails = try insertStubMovieDetails(id: id)
        mockNetworkManager.successObject = movieDetails

        let expt = expectation(description: "Movie and movie detail should have an valid relation ship")
        
        movieDetailsStore
            .movieDetailsSubject
            .sink { (_) in
            } receiveValue: { (movieDetailsStoreResult) in
                guard movieDetailsStoreResult.error == nil, movieDetailsStoreResult.dataType == .live else { return }
                guard movie.details != nil else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        movieDetailsStore.getMovieDetails(id: id)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

}

// TODO: These helper methods should be in a common class as they are replicated
extension MovieDetailsStore_Tests {
    func insertStubMovie(id: String = NSUUID().uuidString) throws -> Movie {
        let movie = Movie(context: self.coreDataStack.backgroundContext)

        movie.id = id
        movie.overview = "overview"
        movie.posterPath = "posterPath"
        movie.title = "title"
        movie.popularity = 300.00

        try self.coreDataStack.saveContext()

        return movie
    }

    @discardableResult func insertStubMovieDetails(id: String = NSUUID().uuidString, shouldSave: Bool = false) throws -> MovieDetails {
        let movieDetails = MovieDetails(context: self.coreDataStack.backgroundContext)

        movieDetails.id = id
        movieDetails.overview = "overview"
        movieDetails.posterPath = "posterPath"
        movieDetails.title = "title"
        movieDetails.originalLanguage = "en"

        guard shouldSave else { return movieDetails }
        try self.coreDataStack.saveContext()

        return movieDetails
    }
    
}
