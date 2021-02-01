//
//  MovieDetailsViewModel.swift
//  Movie-DB
//
//  Created by Vidhyadharan on 23/12/20.
//

import Foundation
import Combine
import Reachability

class MovieDetailsViewModel: ObservableObject {

    private let movieId: String
    
    @Published var isLoading: Bool = false
    @Published var movieDetails: MovieDetails? = nil
    @Published var dataType: DataType = .noData
    
    @Published var isOffline = false
    @Published var showNoData = false
    @Published var showDetails = false

    private lazy var showOfflineView: AnyPublisher<Bool, Never> = {
        Publishers
            .CombineLatest3(self.$dataType, self.$isLoading, self.$movieDetails)
            .map { element in
                if element.0 == .cached, !element.1, element.2 != nil {
                    return true
                } else {
                    return false
                }
            }
            .eraseToAnyPublisher()
    }()
    
    private lazy var showNoDataLabel: AnyPublisher<Bool, Never> = {
        Publishers
            .CombineLatest(self.$movieDetails, self.$isLoading)
            .map { element in
                if element.0 == nil, !element.1 {
                    return true
                } else {
                    return false
                }
            }
            .eraseToAnyPublisher()
    }()
    
    private lazy var showDetailsView: AnyPublisher<Bool, Never> = {
        Publishers
            .CombineLatest(self.$movieDetails, self.$isLoading)
            .map { element in
                if element.0 != nil, !element.1 {
                    return false
                } else {
                    return true
                }
            }
            .eraseToAnyPublisher()
    }()

    @Published var error: Error? = nil
    
    let movieDetailsStore: MovieDetailsStoreProtocol
    
    private var cancellableSet: Set<AnyCancellable> = []

    init(movieId: String, movieDetailsStore: MovieDetailsStoreProtocol = MovieDetailsStore()) {
        self.movieId = movieId
        self.movieDetailsStore = movieDetailsStore
        
        showOfflineView.assign(to: &self.$isOffline)
        showNoDataLabel.assign(to: &self.$showNoData)
        showDetailsView.assign(to: &self.$showDetails)
        
        NotificationCenter.default.publisher(for: .reachabilityChanged)
            .sink(receiveValue: { [weak self] (notification) in
                guard let self = self, let reachability = notification.object as? Reachability,
                      reachability.connection != .unavailable, self.dataType != .live else { return }
                self.getMovieDetails()
            })
            .store(in: &cancellableSet)
        
        bindStore()
        getMovieDetails()
    }
    
    func bindStore() {
        movieDetailsStore
            .movieDetailsSubject
            .sink { [weak self] (completion) in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self?.error = error
                }
            } receiveValue: { [weak self] (storeState) in
                self?.isLoading = false
                self?.dataType = storeState.dataType
                self?.movieDetails = storeState.movieDetails
            }.store(in: &cancellableSet)
    }

    func getMovieDetails() {
        self.isLoading = true
        
        movieDetailsStore.getMovieDetails(id: self.movieId)
    }
}
