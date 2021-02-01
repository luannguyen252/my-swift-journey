//
//  MovieDetailsStore.swift
//  Movie-DB
//
//  Created by Vidhyadharan on 23/12/20.
//

import Foundation
import CoreData
import Combine

struct MovieDetailsStoreResult {
    let dataType: DataType
    let movieDetails: MovieDetails?
    let error: Error?
}

protocol MovieDetailsStoreProtocol {
    var movieDetailsSubject: PassthroughSubject<MovieDetailsStoreResult, Error> { get }

    func getMovieDetails(id: String)
}

class MovieDetailsStore: MovieDetailsStoreProtocol {
    
    let coreDataStack: PersistenceController
    let networkManager: NetworkManagerProtocol

    let movieDetailsSubject = PassthroughSubject<MovieDetailsStoreResult, Error>()

    private var cancellableSet: Set<AnyCancellable> = []

    init(coreDataStack: PersistenceController = PersistenceController.shared,
         networkManager: NetworkManagerProtocol = NetworkManager.sharedInstance) {
        self.coreDataStack = coreDataStack
        self.networkManager = networkManager
    }
    
    func getMovieDetails(id: String) {
        let endpoint = Endpoints.MovieDetails(movieId: id)

        let backgroundContext = self.coreDataStack.backgroundContext
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.context] = backgroundContext
        
        func apiFailureHandler(error: Error?) {
            var failureError = error
            do {
                if let details = try self.getMovieDetailsFromDB(id: id) {
                    self.movieDetailsSubject.send(MovieDetailsStoreResult(dataType: .cached, movieDetails: details, error: error))
                    return
                }
            } catch (let coreDataError) {
                failureError = coreDataError
            }
            
            self.movieDetailsSubject.send(MovieDetailsStoreResult(dataType: .noData, movieDetails: nil, error: failureError))
        }

        let networkCallPublisher: AnyPublisher<MovieDetails?, NetworkManagerError> = networkManager.apiDataTask(endpoint: endpoint, decoder: decoder)
        
        networkCallPublisher.sink { [weak self] (completion) in
            switch completion {
            case .finished: break
            case .failure(let error):
                switch error {
                case .apiErrorResponse(let dictionary):
                    if let code = dictionary["status_code"] as? Int, code == 34 {
                        self?.movieDetailsSubject.send(MovieDetailsStoreResult(dataType: .inValid, movieDetails: nil, error: error))
                    }
                default:
                    apiFailureHandler(error: error)
                }
            }
        } receiveValue: { [weak self] (movieDetails) in
            if let details = movieDetails {
                do {
                    let details = try self?.saveMovieDetailsToDB(movieDetails: details)
                    self?.movieDetailsSubject.send(MovieDetailsStoreResult(dataType: .live, movieDetails: details, error: nil))
                } catch (let coreDataError) {
                    apiFailureHandler(error: coreDataError)
                }
            } else {
                apiFailureHandler(error: nil)
            }
        }.store(in: &cancellableSet)
    }
    
    // TODO: Would be better to put these helper methods in an extension
    private func saveMovieDetailsToDB(movieDetails: MovieDetails) throws -> MovieDetails? {
        let backgroundContext = self.coreDataStack.backgroundContext
        let id = movieDetails.id!
        do {
            let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %@", id)
                        
            if let movie = try backgroundContext.fetch(fetchRequest).first {
                movie.details = movieDetails
            }
        } catch {
            throw error
        }
        
        try coreDataStack.saveContext()
        return try getMovieDetailsFromDB(id: id)
    }
    
    private func getMovieDetailsFromDB(id: String) throws -> MovieDetails? {
        let viewContext = self.coreDataStack.viewContext
        
        let fetchRequest: NSFetchRequest<MovieDetails> = MovieDetails.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
                
        return try viewContext.fetch(fetchRequest).first
    }
    
}
