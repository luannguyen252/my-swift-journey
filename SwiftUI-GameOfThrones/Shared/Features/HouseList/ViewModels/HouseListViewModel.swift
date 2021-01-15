import AdvancedList
import Combine
import SwiftUI

final class HouseListViewModel: ObservableObject {
    private let apiService: APIService
    private var getCurrentHousesCancellable: AnyCancellable?
    private var getNextHousesCancellable: AnyCancellable?

    private var currentPage: Int
    private let pageSize: Int

    @Published private(set) var allHousesLoaded: Bool
    @Published private(set) var houseModels: [HouseMetadataModel] = []
    @Published private(set) var listState: ListState = .items

    private(set) lazy var pagination: AdvancedListPagination<AnyView, AnyView> = {
        .thresholdItemPagination(errorView: { error in
            AnyView(
                VStack {
                    Text(error.localizedDescription)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        self.getCurrentHouses(isInitialLoading: false)
                    }) {
                        Text("Retry")
                    }.padding()
                }
            )
        }, loadingView: {
            AnyView(
                VStack {
                    Divider()
                    Text("Loading...")
                }
            )
        }, offset: pageSize - 1, shouldLoadNextPage: {
            self.getNextHouses()
        }, state: .idle)
    }()

    init() {
        apiService = APIService()
        currentPage = 1
        pageSize = 50
        allHousesLoaded = false

        loadHouses()
    }
}

extension HouseListViewModel {
    func loadHouses() {
        getCurrentHouses(isInitialLoading: true)
    }

    func retry() {
        getCurrentHouses(isInitialLoading: true)
    }
}

private extension HouseListViewModel {
    func getCurrentHouses(isInitialLoading: Bool) {
        if isInitialLoading {
            listState = .loading
        } else {
            pagination.state = .loading
        }
        
        getCurrentHousesCancellable = getCurrentHouses()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
                case .failure(let error):
                    if isInitialLoading {
                        self.listState = .error(error)
                    } else {
                        self.pagination.state = .error(error)
                    }
                case .finished:
                    if isInitialLoading {
                        self.listState = .items
                    } else {
                        self.pagination.state = .idle
                    }
            }
        }) { houseDataModels in
            let houseModels: [HouseMetadataModel] = houseDataModels.compactMap { houseDataModel in
                return HouseMetadataModel(
                    url: houseDataModel.url,
                    name: houseDataModel.name
                )
            }
            self.houseModels.append(contentsOf: houseModels)
        }
    }
    
    func getNextHouses() {
        guard !allHousesLoaded, pagination.state == .idle else {
            return
        }
        
        pagination.state = .loading
        
        getNextHousesCancellable = getNextHouses()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .failure(let error):
                        if let viewModelError = error as? HouseListViewModelError, viewModelError == .allHousesLoaded {
                            self.pagination.state = .idle
                        } else {
                            self.pagination.state = .error(error)
                        }
                    case .finished:
                        self.pagination.state = .idle
                }
            }) { houseDataModels in
                self.allHousesLoaded = houseDataModels.count < self.pageSize
                
                let houseModels: [HouseMetadataModel] = houseDataModels.compactMap { houseDataModel in
                    return HouseMetadataModel(
                        url: houseDataModel.url,
                        name: houseDataModel.name
                    )
                }
                self.houseModels.append(contentsOf: houseModels)
            }
    }

    func getNextHouses() -> AnyPublisher<[HouseDataModel], Error> {
        currentPage += 1

        return apiService.getHouses(page: currentPage, pageSize: pageSize)
            .tryCompactMap { houseResponseModels in
                return try houseResponseModels.compactMap { try $0.houseDataModel() }
            }.eraseToAnyPublisher()
    }

    func getCurrentHouses() -> AnyPublisher<[HouseDataModel], Error> {
        return apiService.getHouses(page: currentPage, pageSize: pageSize)
            .tryCompactMap { houseResponseModels in
                return try houseResponseModels.compactMap { try $0.houseDataModel() }
            }.eraseToAnyPublisher()
    }
}
