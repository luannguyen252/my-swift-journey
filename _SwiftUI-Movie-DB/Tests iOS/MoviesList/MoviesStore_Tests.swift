//
//  MoviesStore_Tests.swift
//  Movie-DBTests
//
//  Created by Vidhyadharan on 23/12/20.
//

import XCTest
import CoreData
import Combine
@testable import Movie_DB_SwiftUI

class MoviesStore_Tests: XCTestCase {
    
    var coreDataStack: PersistenceController!
    var mockNetworkManager: MockNetworkManager!
    var moviesStore: MoviesStore!
    
    var cancellableSet: Set<AnyCancellable>!

    override func setUpWithError() throws {
        coreDataStack = PersistenceController(inMemory: true)
        mockNetworkManager = MockNetworkManager()
        moviesStore = MoviesStore(coreDataStack: coreDataStack, networkManager: mockNetworkManager)
        cancellableSet = []
    }

    override func tearDownWithError() throws {        
        coreDataStack = nil
        mockNetworkManager = nil
        moviesStore = nil
    }

    func test_MoviesCount() throws {
        let count = 6
        try insertStubValues(count: count)
        let moviesCount = moviesStore.getPersistedMoviesCount()
        
        XCTAssertTrue(count == moviesCount)
    }
    
    func test_noNetwork_noCachedData() throws {
        let error = NetworkManagerError.networkFailureError("No network")
        mockNetworkManager.failureError = error
        mockNetworkManager.successObject = nil
        
        let expt = expectation(description: "Should fail due to network")
        
        moviesStore
            .moviesResponseSubject
            .sink { (_) in
            } receiveValue: { (moviesStoreResult) in
                guard let _ = moviesStoreResult.error, moviesStoreResult.dataType == .noData else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        moviesStore.getMovies(category: .popular)

        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_noNetwork_cachedData() throws {
        let error = NetworkManagerError.networkFailureError("No network")
        mockNetworkManager.failureError = error
        mockNetworkManager.successObject = nil

        try insertStubValues(count: 10)
        
        let expt = expectation(description: "Should return cached data")
        
        moviesStore
            .moviesResponseSubject
            .sink { (_) in
            } receiveValue: { (moviesStoreResult) in
                guard let _ = moviesStoreResult.error, moviesStoreResult.dataType == .cached else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        moviesStore.getMovies(category: .popular)

        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_validNetwork_cachedData_noError() throws {
        let movie = insertMovie()
        mockNetworkManager.successObject = Movies(page: 1, results: [movie], totalPages: 1, totalResults: 0)

        let expt = expectation(description: "Should return cached data")
        
        moviesStore
            .moviesResponseSubject
            .sink { (_) in
            } receiveValue: { (moviesStoreResult) in
                guard moviesStoreResult.error == nil, moviesStoreResult.dataType == .live else { return }
                expt.fulfill()
            }
            .store(in: &cancellableSet)
        
        moviesStore.getMovies(category: .popular)

        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_deleteAllMovies() throws {
        try insertStubValues(count: 2)
        try moviesStore.deleteAllMovies()
        
        let moviesCount = moviesStore.getPersistedMoviesCount()
        
        XCTAssertTrue(moviesCount == 0)
    }

}

// MARK: - Helpers

extension MoviesStore_Tests {
    
    @discardableResult func insertMovie() -> Movie {
        let movie = Movie(context: self.coreDataStack.backgroundContext)
        
        movie.setValue(NSUUID().uuidString, forKey: "id")
        movie.setValue("overview", forKey: "overview")
        movie.setValue("posterPath", forKey: "posterPath")
        movie.setValue("title", forKey: "title")
        movie.setValue(300.00, forKey: "popularity")
        
        return movie
    }
    
    func insertStubValues(count: Int, shouldSave: Bool = true) throws {
        var movieCount = count
        
        while movieCount > 0 {
            insertMovie()
            movieCount = movieCount - 1
        }
        
        guard shouldSave else { return }
        try self.coreDataStack.saveContext()
    }
}
