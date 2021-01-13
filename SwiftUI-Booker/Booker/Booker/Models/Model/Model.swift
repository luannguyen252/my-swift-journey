import Foundation
import Combine

final class Model: ModelProtocol {
    private let userDefaults = UserDefaults.standard
    
    init() {  }
    
    @Published var bookingDatas = UserDefaults.standard.get(.bookingDatas) ?? [] {
        didSet { userDefaults.set(bookingDatas, forKey: .bookingDatas) }
    }
}
