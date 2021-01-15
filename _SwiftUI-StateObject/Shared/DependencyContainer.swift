import Foundation

final class DependencyContainer: ObservableObject {
    let entryStore = EntryStore()
}

final class EntryStore {
    let entry = [Entry]()
}

struct Entry {
    let name: String
}
