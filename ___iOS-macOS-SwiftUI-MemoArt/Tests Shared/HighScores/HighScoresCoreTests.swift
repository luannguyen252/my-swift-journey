import XCTest
@testable import MemoArt
import ComposableArchitecture

class HighScoresCoreTests: XCTestCase {
    func testAddNewScoreWhenHighScoresIsEmpty() {
        let store = TestStore(
            initialState: HighScoresState(),
            reducer: highScoresReducer,
            environment: .test
        )
        let newHighScore = HighScore(score: 100, name: "Mario", date: .test)
        store.assert(
            .send(.addScore(newHighScore, .normal)) {
                $0.boards = Boards(
                    easy: [],
                    normal: [newHighScore],
                    hard: []
                )
            },
            .receive(.save)
        )
    }

    func testAddNewScoreWhenHighScoresIsNotEmpty() {
        let store = TestStore(
            initialState: HighScoresState(boards: Boards(
                easy: [],
                normal: [HighScore(score: 100, name: "Mario", date: .test)],
                hard: []
            )),
            reducer: highScoresReducer,
            environment: .test
        )
        let newHighScore = HighScore(score: 90, name: "Luigi", date: .test)
        store.assert(
            .send(.addScore(newHighScore, .normal)) {
                $0.boards = Boards(
                    easy: [],
                    normal: [newHighScore, HighScore(score: 100, name: "Mario", date: .test)],
                    hard: []
                )
            },
            .receive(.save)
        )
    }

    // swiftlint:disable:next function_body_length
    func testAddNewScoreButScoreIsNotTheBest() {
        let store = TestStore(
            initialState: HighScoresState(boards: Boards(
                easy: [],
                normal: [
                    HighScore(score: 90, name: "Luigi", date: .test),
                    HighScore(score: 100, name: "Mario", date: .test),
                ],
                hard: []
            )),
            reducer: highScoresReducer,
            environment: .test
        )
        let newHighScore = HighScore(score: 95, name: "Peach", date: .test)
        let anotherNewHighScore = HighScore(score: 105, name: "Yoshi", date: .test)
        let aThirdNewHighScore = HighScore(score: 98, name: "Toad", date: .test)
        let aFourthNewHighScore = HighScore(score: 87, name: "Wario", date: .test)
        store.assert(
            .send(.addScore(newHighScore, .normal)) {
                let newHighScores = [
                    HighScore(score: 90, name: "Luigi", date: .test),
                    newHighScore,
                    HighScore(score: 100, name: "Mario", date: .test),
                ]
                $0.boards = Boards(easy: [], normal: newHighScores, hard: [])
            },
            .receive(.save),
            .send(.addScore(anotherNewHighScore, .normal)) {
                let newHighScores = [
                    HighScore(score: 90, name: "Luigi", date: .test),
                    newHighScore,
                    HighScore(score: 100, name: "Mario", date: .test),
                    anotherNewHighScore,
                ]
                $0.boards = Boards(easy: [], normal: newHighScores, hard: [])
            },
            .receive(.save),
            .send(.addScore(aThirdNewHighScore, .normal)) {
                let newHighScores = [
                    HighScore(score: 90, name: "Luigi", date: .test),
                    newHighScore,
                    aThirdNewHighScore,
                    HighScore(score: 100, name: "Mario", date: .test),
                    anotherNewHighScore,
                ]
                $0.boards = Boards(easy: [], normal: newHighScores, hard: [])
            },
            .receive(.save),
            .send(.addScore(aFourthNewHighScore, .normal)) {
                let newHighScores = [
                    aFourthNewHighScore,
                    HighScore(score: 90, name: "Luigi", date: .test),
                    newHighScore,
                    aThirdNewHighScore,
                    HighScore(score: 100, name: "Mario", date: .test),
                    anotherNewHighScore,
                ]
                $0.boards = Boards(easy: [], normal: newHighScores, hard: [])
            },
            .receive(.save)
        )
    }

    func testAddNewScoreWhenThereIsAlready10Scores() {
        let store = TestStore(
            initialState: .test,
            reducer: highScoresReducer,
            environment: .test
        )

        let newHighScore = HighScore(score: 10, name: "Peach", date: .test)
        let anotherNewHighScore = HighScore(score: 11, name: "Yoshi", date: .test)
        let currentHighScores = HighScoresState.test.boards.normal
        store.assert(
            .send(.addScore(newHighScore, .normal)) {
                $0.boards = Boards(
                    easy: currentHighScores,
                    normal: [newHighScore] + currentHighScores.prefix(9),
                    hard: currentHighScores
                )
            },
            .receive(.save),
            .send(.addScore(anotherNewHighScore, .normal)) {
                $0.boards = Boards(
                    easy: currentHighScores,
                    normal: [newHighScore, anotherNewHighScore] + currentHighScores.prefix(8),
                    hard: currentHighScores
                )
            },
            .receive(.save),
            .send(.addScore(HighScore(score: 200, name: "Will not be in the HighScore", date: .test), .normal)) {
                // Ensure we are not adding a score that is out of the best 10 scores
                $0.boards = Boards(
                    easy: currentHighScores,
                    normal: [newHighScore, anotherNewHighScore] + currentHighScores.prefix(8),
                    hard: currentHighScores
                )
            },
            .receive(.save)
        )
    }

    func testNewHighScoreWithTheSameValueAsAnotherIsAddedOnTopOfTheFirstSameScore() {
        let store = TestStore(
            initialState: .test,
            reducer: highScoresReducer,
            environment: .test
        )

        let newHighScore = HighScore(score: 20, name: "Peach", date: Date.test.advanced(by: 1))
        let anotherNewHighScore = HighScore(score: 30, name: "Yoshi", date: Date.test.advanced(by: 2))
        let currentHighScores = HighScoresState.test.boards.normal
        store.assert(
            .send(.addScore(newHighScore, .normal)) {
                $0.boards = Boards(
                    easy: currentHighScores,
                    normal: [newHighScore] + currentHighScores.prefix(9),
                    hard: currentHighScores
                )
            },
            .receive(.save),
            .send(.addScore(anotherNewHighScore, .normal)) {
                $0.boards = Boards(
                    easy: currentHighScores,
                    normal: [
                        newHighScore,
                        HighScore(score: 20, name: "Test 0", date: .test),
                        anotherNewHighScore,
                        HighScore(score: 30, name: "Test 1", date: .test),
                        HighScore(score: 40, name: "Test 2", date: .test),
                        HighScore(score: 50, name: "Test 3", date: .test),
                        HighScore(score: 60, name: "Test 4", date: .test),
                        HighScore(score: 70, name: "Test 5", date: .test),
                        HighScore(score: 80, name: "Test 6", date: .test),
                        HighScore(score: 90, name: "Test 7", date: .test),
                    ],
                    hard: currentHighScores
                )
            },
            .receive(.save)
        )
    }

    func testNewHighScoreInEasyAndHardBoards() {
        let store = TestStore(
            initialState: .test,
            reducer: highScoresReducer,
            environment: .test
        )

        let newHighScore = HighScore(score: 20, name: "Peach", date: Date.test.advanced(by: 1))
        let currentHighScores = HighScoresState.test.boards.normal
        store.assert(
            .send(.addScore(newHighScore, .normal)) {
                $0.boards = Boards(
                    easy: currentHighScores,
                    normal: [newHighScore] + currentHighScores.prefix(9),
                    hard: currentHighScores
                )
            },
            .receive(.save),
            .send(.addScore(newHighScore, .easy)) {
                $0.boards = Boards(
                    easy: [newHighScore] + currentHighScores.prefix(9),
                    normal: [newHighScore] + currentHighScores.prefix(9),
                    hard: currentHighScores
                )
            },
            .receive(.save),
            .send(.addScore(newHighScore, .hard)) {
                $0.boards = Boards(
                    easy: [newHighScore] + currentHighScores.prefix(9),
                    normal: [newHighScore] + currentHighScores.prefix(9),
                    hard: [newHighScore] + currentHighScores.prefix(9)
                )
            },
            .receive(.save)
        )
    }

    func testLoadPersistedHighScores() {
        let store = TestStore(
            initialState: .someHighScores,
            reducer: highScoresReducer,
            environment: .someHighScores
        )

        store.assert(
            .send(.load) {
                $0.boards = HighScoresState.someHighScores.boards
            }
        )
    }

    func testPresentAndHideHighScores() {
        let store = TestStore(
            initialState: .someHighScores,
            reducer: highScoresReducer,
            environment: .test
        )

        store.assert(
            .send(.present) {
                $0.isPresented = true
            },
            .send(.hide) {
                $0.isPresented = false
            }
        )
    }
}

extension Date {
    static let test = Date(timeIntervalSince1970: 12345)
}

extension HighScoresState {
    static var test: Self {
        let highScores = (0..<10).map { HighScore(score: ($0 + 2) * 10, name: "Test \($0)", date: .test) }
        return HighScoresState(boards: Boards(
            easy: highScores,
            normal: highScores,
            hard: highScores
        ))
    }

    static var someHighScores: Self {
        HighScoresState(boards: Boards(
            easy: [
                HighScore(score: 5, name: "First easy High Score", date: .test),
                HighScore(score: 6, name: "Second easy High Score", date: .test),
                HighScore(score: 7, name: "Third easy High Score", date: .test),
            ],
            normal: [
                HighScore(score: 10, name: "First normal High Score", date: .test),
                HighScore(score: 11, name: "Second normal High Score", date: .test),
                HighScore(score: 12, name: "Third normal High Score", date: .test),
            ],
            hard: [
                HighScore(score: 15, name: "First hard High Score", date: .test),
                HighScore(score: 16, name: "Second hard High Score", date: .test),
                HighScore(score: 17, name: "Third hard High Score", date: .test),
            ]
        ))
    }
}

extension HighScoresEnvironment {
    static let test = HighScoresEnvironment(load: { .test }, save: { _ in })
    static let someHighScores = HighScoresEnvironment(load: { .someHighScores }, save: { _ in })
}
