import Foundation

/// @mockable
protocol SearchTopUseCase {
    func fetch(query: String)
}

final class SeaerchTopUseCaseImpl: SearchTopUseCase {
    init() {
    }

    func fetch(query: String) {
    }
}
