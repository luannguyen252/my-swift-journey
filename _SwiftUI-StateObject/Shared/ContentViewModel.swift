import Foundation

final class ContentViewModel: ObservableObject {
    private var refreshCount = 0
    @Published var refreshTimestamp = ""
    
    init() {
        print(self, #function)
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .long
        return formatter
    }()
    
    func refresh() {
        print("Triggering ContentView refresh")
        refreshCount += 1
        refreshTimestamp = "Count=\(refreshCount) \(dateFormatter.string(from: Date()))"
    }
}
