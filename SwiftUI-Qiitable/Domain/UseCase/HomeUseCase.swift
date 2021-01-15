import Foundation

/// @mockable
protocol HomeUseCase {
    func fetch(page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}

final class HomeUseCaseImpl: HomeUseCase {
    let repository: ItemRepository

    init(repository: ItemRepository) {
        self.repository = repository
    }

    func fetch(page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void) {
        repository.fetch(page: page, completion: completion)
    }
}
