import Foundation

/// @mockable
protocol SearchListUseCase {
    func fetch(query: String, page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}

final class SearchListUseCaseImpl: SearchListUseCase {
    private let repository: ItemRepository

    init(repository: ItemRepository) {
        self.repository = repository
    }

    func fetch(query: String, page: Int, completion: @escaping (Result<[Item], Error>) -> Void) {
        repository.search(query: query, page: page, completion: completion)
    }
}
