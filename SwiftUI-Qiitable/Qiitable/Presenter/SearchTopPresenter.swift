import Foundation
import Combine

protocol SearchTopPresenter: ObservableObject {
    var historyItems: [String] { get set }
    var searchText: String { get set }
    func onCommit()
    func showSearchListView() -> SearchListView
}

final class SearchTopPresenterImpl: SearchTopPresenter {
    @Published var historyItems: [String] = []
    @Published var searchText: String = ""
    @Published var isSearch: Bool = false

    private let router: SearchTopRouter
    private let useCase: SearchTopUseCase

    init(router: SearchTopRouter, useCase: SearchTopUseCase) {
        self.router = router
        self.useCase = useCase
    }

    func onCommit() {
        isSearch = true
    }

    func showSearchListView() -> SearchListView {
        return router.makeSearchListView(text: searchText)
    }
}
