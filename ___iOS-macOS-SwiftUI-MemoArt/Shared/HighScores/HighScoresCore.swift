import ComposableArchitecture

struct HighScoresState: Equatable, Codable {
    var boards = Boards(easy: [], normal: [], hard: [])
    var isPresented = false
}

enum HighScoresAction: Equatable {
    case addScore(HighScore, DifficultyLevel)
    case load
    case save
    case present
    case hide
}

struct HighScoresEnvironment {
    let load: () -> HighScoresState
    let save: (HighScoresState) -> Void
}

let highScoresReducer = Reducer<
    HighScoresState,
    HighScoresAction,
    HighScoresEnvironment
> { state, action, environment in
    switch action {
    case let .addScore(newHighScore, level):
        let currentLevelHighScores = state.boards.highScores(level: level)
        guard !currentLevelHighScores.isEmpty else {
            state.boards.setHighScores(highScores: [newHighScore], level: level)
            return Effect(value: .save)
        }

        let newHighScores = (currentLevelHighScores + [newHighScore])
            .sorted(by: {
                $0.score == $1.score
                    ? $0.date > $1.date
                    : $0.score <= $1.score
            })
            .prefix(10)
        state.boards.setHighScores(highScores: newHighScores, level: level)

        return Effect(value: .save)
    case .load:
        state = environment.load()
        return .none
    case .save:
        environment.save(state)
        return .none
    case .present:
        state.isPresented = true
        return .none
    case .hide:
        state.isPresented = false
        return .none
    }
}

extension Array {
    func prefix(_ maxLength: Int) -> Self {
        let slicedArray: ArraySlice = self.prefix(maxLength)
        return Array(slicedArray)
    }
}

#if DEBUG
extension HighScoresState {
    static var preview: Self {
        let highScores = (1...10).map {
            HighScore(score: 10 * $0, name: "Preview player \($0)", date: .preview)
        }
        return HighScoresState(boards: Boards(
            easy: highScores,
            normal: highScores,
            hard: highScores
        ))
    }

    static var miscellaneous: Self {
        let easyHighScores = (1...10).map {
            HighScore(score: 10 * $0, name: "Preview player \($0)", date: .preview)
        }
        let normalHighScores = (1...9).map {
            HighScore(score: 10 * $0, name: "Preview player \($0)", date: .preview)
        }
        let hardHighScores = (1...3).map {
            HighScore(score: 10 * $0, name: "Preview player \($0)", date: .preview)
        }
        return HighScoresState(boards: Boards(
            easy: easyHighScores,
            normal: normalHighScores,
            hard: hardHighScores
        ))
    }
}

extension HighScoresEnvironment {
    static var preview: Self { HighScoresEnvironment(load: { .preview }, save: { _ in }) }
}
#endif
