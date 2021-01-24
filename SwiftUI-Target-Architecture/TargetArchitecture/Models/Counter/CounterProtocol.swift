import Foundation
import Combine

protocol CounterProtocol {
    var counter: AnyPublisher<Int, Never> { get }
    var isCounterStarted: Bool { get set }
    
    func resetCounter()
}
