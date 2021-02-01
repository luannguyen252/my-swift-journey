//
//  MovieDetailsViewModel_Tests.swift
//  Movie-DBTests
//
//  Created by Vidhyadharan on 26/12/20.
//

import XCTest
import Combine
@testable import Movie_DB_SwiftUI

class MovieDetailsViewModel_Tests: XCTestCase {
    
    var coreDataStack: PersistenceController!

    let movieId = "434344"
    var mockMovieDetailsStore: MockMovieDetailsStore!
    var viewModel: MovieDetailsViewModel!
    
    var isLoadingEvents: [Bool]!
    var isOfflineEvents: [Bool]!
    var showNoDataEvents: [Bool]!
    
    var cancellableSet: Set<AnyCancellable>!

    override func setUpWithError() throws {
        coreDataStack = PersistenceController(inMemory: true)
        
        mockMovieDetailsStore = MockMovieDetailsStore()
        viewModel = MovieDetailsViewModel(movieId: self.movieId, movieDetailsStore: mockMovieDetailsStore)
        cancellableSet = []
        
        isLoadingEvents = []
        isOfflineEvents = []
        showNoDataEvents = []

        viewModel.$isLoading.sink { [weak self] isLoading in
            self?.isLoadingEvents.append(isLoading)
        }.store(in: &cancellableSet)

        viewModel.$isOffline.sink { [weak self] isOffline in
            self?.isOfflineEvents.append(isOffline)
        }.store(in: &cancellableSet)

        viewModel.$showNoData.sink { [weak self] showNoData in
            self?.showNoDataEvents.append(showNoData)
        }.store(in: &cancellableSet)

    }

    override func tearDownWithError() throws {
        coreDataStack = nil
        mockMovieDetailsStore = nil
        viewModel = nil
        
        isLoadingEvents = nil
        isOfflineEvents = nil
        showNoDataEvents = nil
        
        cancellableSet = nil
    }
    
    func test_isLoading() throws {
        viewModel.getMovieDetails()

        XCTAssertEqual(isLoadingEvents, [false, true, false])
    }

    
    func test_initialNoDataState() throws {
        viewModel.getMovieDetails()

        XCTAssertEqual(isLoadingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isOfflineEvents.dropAllButLast(), [false])
        XCTAssertEqual(showNoDataEvents.dropAllButLast(), [true])
    }

    func test_noNetwork_noCachedData_error() throws {
        mockMovieDetailsStore.movieDetailsStoreResult = MovieDetailsStoreResult(dataType: .noData, movieDetails: nil, error: NetworkManagerError.networkFailureError("Network Error"))
        
        viewModel.getMovieDetails()
        
        XCTAssertEqual(isLoadingEvents, [false, true, false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, false)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, true)
    }
    
    func test_validNetwork_liveData_noError() throws {
        let movieDetails = self.stubMovieDetails(id: self.movieId)
        mockMovieDetailsStore.movieDetailsStoreResult = MovieDetailsStoreResult(dataType: .live, movieDetails: movieDetails, error: nil)
        
        viewModel.getMovieDetails()
        
        XCTAssertEqual(isLoadingEvents, [false, true, false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, false)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, false)
    }
    
    func test_noNetwork_cachedData_error() throws {
        let movieDetails = self.stubMovieDetails(id: self.movieId)
        mockMovieDetailsStore.movieDetailsStoreResult = MovieDetailsStoreResult(dataType: .cached, movieDetails: movieDetails, error: NetworkManagerError.networkFailureError("Network Error"))

        viewModel.getMovieDetails()
        
        XCTAssertEqual(isLoadingEvents, [false, true, false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, true)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, false)
    }
    
    func test_noLiveData_invalidMovieId_error() throws {
        let error = NetworkManagerError.apiErrorResponse(["status_code": 34])
        mockMovieDetailsStore.movieDetailsStoreResult = MovieDetailsStoreResult(dataType: .inValid, movieDetails: nil, error: error)

        viewModel.getMovieDetails()
        
        XCTAssertEqual(isLoadingEvents, [false, true, false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, false)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, true)
    }

}

extension MovieDetailsViewModel_Tests {
    func stubMovieDetails(id: String) -> MovieDetails {
        let movieDetails = MovieDetails(context: self.coreDataStack.backgroundContext)
            
        movieDetails.id = id
        movieDetails.overview = "overview"
        movieDetails.posterPath = "posterPath"
        movieDetails.title = "title"
        movieDetails.originalLanguage = "en"
        
        return movieDetails
    }
}
