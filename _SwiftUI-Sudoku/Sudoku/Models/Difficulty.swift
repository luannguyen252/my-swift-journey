import Foundation

final class Difficulty: ObservableObject {

    enum Level: String {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }

    @Published
    var level: Level

    init(level: Level) {
        self.level = level
    }
}
