import Foundation

/// @mockable
protocol RootPresenter: ObservableObject {
    func showHomeView() -> HomeView
    func showSearchTopView() -> SearchTopView
}

final class RootPresenterImpl: RootPresenter {
    private let router: RootRouter

    init(router: RootRouter) {
        self.router = router
    }

    func showHomeView() -> HomeView {
        router.makeHomeView()
    }

    func showSearchTopView() -> SearchTopView {
        router.makeSearchTopView()
    }
}
