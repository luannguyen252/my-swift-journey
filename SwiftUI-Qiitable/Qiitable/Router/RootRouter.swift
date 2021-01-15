import Foundation

/// @mockable
protocol RootRouter {
    func makeHomeView() -> HomeView
    func makeSearchTopView() -> SearchTopView
}

final class RootRouterImpl: RootRouter {
    func makeHomeView() -> HomeView {
        let connection = ConnectionImpl(session: URLSession.shared)
        let repository = ItemRepositoryImpl(connection: connection)
        let useCase = HomeUseCaseImpl(repository: repository)
        let router = HomeRouterImpl()
        return HomeView(presenter: HomePresenterImpl(router: router, useCase: useCase))
    }

    func makeSearchTopView() -> SearchTopView {
        let router = SearchTopRouterImpl()
        let useCase = SeaerchTopUseCaseImpl()
        let presenter = SearchTopPresenterImpl(router: router, useCase: useCase)
        return SearchTopView(presenter: presenter)
    }
}
