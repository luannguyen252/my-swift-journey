//
//  MoviesViewModel_Tests.swift
//  Movie-DBTests
//
//  Created by Vidhyadharan on 26/12/20.
//

import XCTest
import Combine
@testable import Movie_DB_SwiftUI

class MoviesViewModel_Tests: XCTestCase {
    
    var mockMoviesStore: MockMoviesStore!
    var viewModel: MoviesViewModel!
    
    var isLoadingEvents: [Bool]!
    var isRefreshingEvents: [Bool]!
    var isOfflineEvents: [Bool]!
    var showNoDataEvents: [Bool]!
    
    var cancellableSet: Set<AnyCancellable>!

    override func setUpWithError() throws {
        mockMoviesStore = MockMoviesStore()
        viewModel = MoviesViewModel(moviesStore: mockMoviesStore!)
        cancellableSet = []
        
        isLoadingEvents = []
        isRefreshingEvents = []
        isOfflineEvents = []
        showNoDataEvents = []

        viewModel.$isLoading.sink { [weak self] isLoading in
            self?.isLoadingEvents.append(isLoading)
        }.store(in: &cancellableSet)

        viewModel.$isRefreshing.sink { [weak self] isRefreshing in
            self?.isRefreshingEvents.append(isRefreshing)
        }.store(in: &cancellableSet)

        viewModel.$isOffline.sink { [weak self] isOffline in
            self?.isOfflineEvents.append(isOffline)
        }.store(in: &cancellableSet)

        viewModel.$showNoData.sink { [weak self] showNoData in
            self?.showNoDataEvents.append(showNoData)
        }.store(in: &cancellableSet)

    }

    override func tearDownWithError() throws {
        mockMoviesStore = nil
        viewModel = nil
        
        isLoadingEvents = nil
        isRefreshingEvents = nil
        isOfflineEvents = nil
        showNoDataEvents = nil
        
        cancellableSet = nil
    }
    
    func test_isLoading() throws {
        viewModel.getMovies()

        XCTAssertEqual(isLoadingEvents, [false, true, false])
    }
    
    func test_isRefreshing() throws {
        mockMoviesStore.moviesStoreResult = MoviesStoreResult(dataType: .cached, error: NetworkManagerError.networkFailureError("Network Error"))
        viewModel.getMovies()
        
        isRefreshingEvents = []
        viewModel.getMovies()

        XCTAssertEqual(isRefreshingEvents, [true, false])
    }
    
    func test_initialNoDataState() throws {
        viewModel.getMovies()

        XCTAssertEqual(isLoadingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isRefreshingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isOfflineEvents.dropAllButLast(), [false])
        XCTAssertEqual(showNoDataEvents.dropAllButLast(), [true])
    }
    
    func test_noNetwork_noCachedData_error() throws {
        mockMoviesStore.moviesStoreResult = MoviesStoreResult(dataType: .noData, error: NetworkManagerError.networkFailureError("Network Error"))
        
        viewModel.getMovies()

        XCTAssertEqual(isLoadingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isRefreshingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, false)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, true)
    }

    func test_noNetwork_cachedData_error() throws {
        mockMoviesStore.moviesStoreResult = MoviesStoreResult(dataType: .cached, error: NetworkManagerError.networkFailureError("Network Error"))
        
        viewModel.getMovies()

        XCTAssertEqual(isLoadingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isRefreshingEvents.dropAllButLast(), [false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, true)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, false)
    }
    
    func test_validNetwork_liveData_noError() throws {
        mockMoviesStore.moviesStoreResult = MoviesStoreResult(dataType: .live, error: nil)
                
        viewModel.getMovies()

        XCTAssertEqual(isLoadingEvents, [false, true, false])
        XCTAssertEqual(isRefreshingEvents, [false, false, false])
        XCTAssertEqual(isOfflineEvents.first!, false)
        XCTAssertEqual(isOfflineEvents.last!, false)
        XCTAssertEqual(showNoDataEvents.first!, true)
        XCTAssertEqual(showNoDataEvents.last!, false)
    }
    
}
