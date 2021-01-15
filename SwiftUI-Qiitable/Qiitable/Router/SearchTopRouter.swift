import Foundation

/// @mockable
protocol SearchTopRouter {
    func makeSearchListView(text: String) -> SearchListView
}

final class SearchTopRouterImpl: SearchTopRouter {
    func makeSearchListView(text: String) -> SearchListView {
        let repository = ItemRepositoryImpl(connection: ConnectionImpl(session: URLSession.shared))
        let useCase = SearchListUseCaseImpl(repository: repository)
        let presenter: SesarchListPresenterImpl = .init(searchText: text, useCase: useCase)
        return SearchListView(presenter: presenter)
    }
}
