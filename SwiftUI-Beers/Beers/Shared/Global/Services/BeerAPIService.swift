import Combine

protocol BeerAPIService {
    func getBeers(page: Int, pageSize: Int) -> AnyPublisher<[Beer], Error>
}
