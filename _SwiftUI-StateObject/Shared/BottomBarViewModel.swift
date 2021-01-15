import Combine
import Foundation

final class BottomBarViewModel: ObservableObject {
    @Published var text: String = ""
    
    private var cancellables = [AnyCancellable]()
    private let entryStore: EntryStore
    
    init(entryStore: EntryStore) {
        self.entryStore = entryStore
        print(self, #function)
        
        cancellables.append(Timer.publish(every: 2, on: .main, in: .default).autoconnect().sink { [weak self] (_) in
            self?.text = "Random number: \(Int.random(in: 0..<100))"
        })
    }
}
