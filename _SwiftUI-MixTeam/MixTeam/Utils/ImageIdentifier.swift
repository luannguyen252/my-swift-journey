import SwiftUI

enum ImageIdentifier: String, Identifiable, Codable {
    case elephant = "elephant"
    case koala = "koala"
    case panda = "panda"
    case octopus = "octopus"
    case lion = "lion"
    case hippo = "hippo"

    case girl = "girl"
    case woman = "woman"
    case jack = "jack"
    case santa = "santa"
    case clown = "clown"
    case pirate = "pirate"

    case unknown = ""

    var image: Image {
        switch self {
        case .unknown: return Image(systemName: "questionmark")
        default: return Image(rawValue)
        }
    }

    var id: String { rawValue }

    static var players: [Self] {
        [
            .girl, santa, .jack, .woman,
            .clown, .pirate,
        ]
    }

    static var teams: [Self] {
        [
            .elephant, .koala, .panda, .octopus, .lion,
            .hippo,
        ]
    }

    var name: String {
        switch self {
        case .elephant: return "elephant"
        case .koala: return "koala"
        case .panda: return "panda"
        case .octopus: return "octopus"
        case .lion: return "lion"
        case .hippo: return "hippopotamus"
        default: return ""
        }
    }
}
