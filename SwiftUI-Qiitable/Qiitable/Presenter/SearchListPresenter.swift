import Foundation

protocol SearchListPresenter: ObservableObject {
    var searchText: String { get set }
    var items: [Item] { get set }
    func onAppear()
    func loadNext(item: Item)
}

final class SesarchListPresenterImpl: SearchListPresenter {
    @Published var searchText: String
    private let useCase: SearchListUseCase
    @Published var items: [Item] = []

    init(searchText: String, useCase: SearchListUseCase) {
        self.searchText = searchText
        self.useCase = useCase
    }

    func onAppear() {
        fetch(mode: .initial)
    }

    func loadNext(item: Item) {

    }

    private func fetch(mode: FetchMode) {
        useCase.fetch(query: searchText, page: mode.page) {[weak self] result in
            guard let self = self else { return }
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
