//
//  MoviesStore.swift
//  Movie-DB
//
//  Created by Vidhyadharan on 23/12/20.
//

import Foundation
import CoreData
import Combine

enum DataType {
    case live
    case cached
    case noData
    case inValid
}

struct MoviesStoreResult {
    let dataType: DataType
    let error: Error?
}

protocol MoviesStoreProtocol {
    var moviesResponseSubject: PassthroughSubject<MoviesStoreResult, Error> { get }
    
    func getMovies(category: Endpoints.Movies.Category)
}

class MoviesStore: MoviesStoreProtocol {
    
    private let coreDataStack: PersistenceController
    private let networkManager: NetworkManagerProtocol

    let moviesResponseSubject = PassthroughSubject<MoviesStoreResult, Error>()
    
    private var cancellableSet: Set<AnyCancellable> = []

    init(coreDataStack: PersistenceController = PersistenceController.shared, networkManager: NetworkManagerProtocol = NetworkManager.sharedInstance) {
        self.coreDataStack = coreDataStack
        self.networkManager = networkManager
    }
    
    func getMovies(category: Endpoints.Movies.Category) {
        let endpoint = Endpoints.Movies(category: category)

        let backgroundContext = self.coreDataStack.backgroundContext

        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.context] = backgroundContext

        func apiFailureHandler(error: Error) {
            if self.getPersistedMoviesCount() != 0 {
                self.moviesResponseSubject.send(MoviesStoreResult(dataType: .cached, error: error))
            } else {
                self.moviesResponseSubject.send(MoviesStoreResult(dataType: .noData, error: error))
            }
        }

        let networkCallPublisher: AnyPublisher<Movies?, NetworkManagerError> = networkManager.apiDataTask(endpoint: endpoint, decoder: decoder)
        
        networkCallPublisher.sink { (completion) in
            switch completion {
            case .finished: break
            case .failure(let error):
                apiFailureHandler(error: error)
            }
        } receiveValue: { [weak self] (_) in
            do {
                try self?.deleteAllMovies()
                try self?.coreDataStack.saveContext()
                
                if self?.getPersistedMoviesCount() ?? 0 != 0 {
                    self?.moviesResponseSubject.send(MoviesStoreResult(dataType: .live, error: nil))
                } else {
                    self?.moviesResponseSubject.send(MoviesStoreResult(dataType: .noData, error: nil))
                }
            } catch (let coreDataError) {
                apiFailureHandler(error: coreDataError)
            }
        }.store(in: &cancellableSet)
    }
    
    func deleteAllMovies() throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Movie.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeObjectIDs

        do {
            let result = try coreDataStack.backgroundContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
            let changes: [AnyHashable: Any] = [NSDeletedObjectsKey: result?.result as? [NSManagedObjectID] ?? []]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [coreDataStack.backgroundContext])
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [coreDataStack.viewContext])
        } catch {
            throw error
        }
    }
    
    func getPersistedMoviesCount() -> Int {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        return (try? coreDataStack.viewContext.count(for: fetchRequest)) ?? 0
    }

}
