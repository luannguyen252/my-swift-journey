import Foundation

extension UserDefaults: LocalDatable {
    enum Key: String {
        case searchHistories
    }

    var searchHistories: [String] {
        get {
            return self.stringArray(forKey: Key.searchHistories.rawValue) ?? []
        }
        set {
            self.set(newValue, forKey: Key.searchHistories.rawValue)
        }
    }
}
