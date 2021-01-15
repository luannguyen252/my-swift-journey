import Combine
import Foundation

final class HouseDetailViewModel: ObservableObject {
    private let apiService = APIService()
    private var getHouseCancellable: AnyCancellable?
    private var currentHouseURL: URL?

    @Published private(set) var state: HouseDetailViewModelState = .idle
}

extension HouseDetailViewModel {
    func loadHouse(atURL url: URL) {
        guard currentHouseURL != url && state != .loading else {
            return
        }

        state = .loading

        getHouseCancellable = getHouse(atURL: url)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in }) { houseDataModel in
                self.currentHouseURL = url
                let model = HouseModel(dataModel: houseDataModel)
                self.state = .loaded(model: model)
            }
    }
}

private extension HouseDetailViewModel {
    func getHouse(atURL url: URL) -> AnyPublisher<HouseDataModel, Error> {
        apiService.getHouse(atURL: url)
            .tryMap { houseResponseModel in
                try houseResponseModel.houseDataModel()
            }.eraseToAnyPublisher()
    }
}
