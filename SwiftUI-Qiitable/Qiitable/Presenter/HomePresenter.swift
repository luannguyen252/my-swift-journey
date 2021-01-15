import Foundation

/// @mockable
protocol HomePresenter: ObservableObject {
    var items: [Item] { get set }
    func onAppear()
    func loadNext(item: Item)
}

enum FetchMode {
    case initial
    case next(page: Int)

    var page: Int {
        switch self {
        case .initial:
            return 1
        case .next(let page):
            return page
        }
    }
}

final class HomePresenterImpl: HomePresenter {
    private let router: HomeRouter
    private let useCase: HomeUseCase
    @Published var items: [Item] = []

    private(set) var isLoading = false
    private(set) var nextPage = 1

    init(router: HomeRouter, useCase: HomeUseCase) {
        self.router = router
        self.useCase = useCase
    }

    func onAppear() {
        fetch(mode: .initial)
    }

    func loadNext(item: Item) {
        guard !isLoading else { return }
        if items.isLastItem(item) {
            isLoading = true
            nextPage += 1
            fetch(mode: .next(page: nextPage))
        }
    }

    private func fetch(mode: FetchMode) {
        useCase.fetch(page: mode.page) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let items):
                switch mode {
                case .initial:
                    self.items = items
                case .next:
                    self.items.append(contentsOf: items)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
