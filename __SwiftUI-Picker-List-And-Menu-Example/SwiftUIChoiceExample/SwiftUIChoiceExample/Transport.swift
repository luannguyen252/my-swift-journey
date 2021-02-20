import Foundation

enum Transport: String, CaseIterable {
    case car
    case bicycle
    case train
    case airplane
}

extension Transport {
    var localizedTitle: String {
        switch self {
        case .car:
            return "🚗"
        case .bicycle:
            return "🚲"
        case .train:
            return "🚂"
        case .airplane:
            return "✈️"
        }
    }
}
