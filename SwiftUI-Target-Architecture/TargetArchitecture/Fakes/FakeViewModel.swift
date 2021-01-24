import Foundation
import Combine

class FakeViewModel: ViewModelProtocol {
    @Published var value: Int
    @Published var isCounterStarted: Bool
    
    init(value: Int, isCounterStarted: Bool) {
        self.value = value
        self.isCounterStarted = isCounterStarted
    }
    
    func reset() {
        self.value = -1
    }
}
