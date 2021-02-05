import Foundation

struct HighScore: Equatable, Codable {
    let score: Int
    let name: String
    let date: Date

    init(score: Int, name: String = "❓", date: Date) {
        self.score = score
        self.name = name
        self.date = date
    }
}

extension HighScore: Identifiable {
    var id: String {
        "\(score) \(name) \(date)"
    }
}

struct Boards: Equatable, Codable {
    var easy: [HighScore]
    var normal: [HighScore]
    var hard: [HighScore]

    func highScores(level: DifficultyLevel) -> [HighScore] {
        switch level {
        case .easy: return easy
        case .normal: return normal
        case .hard: return hard
        }
    }

    mutating func setHighScores(highScores: [HighScore], level: DifficultyLevel) {
        switch level {
        case .easy: easy = highScores
        case .normal: normal = highScores
        case .hard: hard = highScores
        }
    }
}
