import XCTest
@testable import MemoArt
import ComposableArchitecture

// MARK: GameCore persistence related tests
extension GameCoreTests {
    func testSavingGame() {
        let expectingSaveGameToBeCalled = expectation(description: "Expect save game to be called")
        let mockedSaveGame: (GameState) -> Void = { _ in
            expectingSaveGameToBeCalled.fulfill()
        }
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler) {
                $0.saveGame = mockedSaveGame
            }
        )
        store.assert(
            .send(.game(.save))
        )
        wait(for: [expectingSaveGameToBeCalled], timeout: 0.1)
    }

    func testLoadGame() {
        let expectingLoadGameToBeCalled = expectation(description: "Expect load game to be called")
        let mockedGameState = GameState(
            moves: 42,
            cards: .predicted,
            discoveredArts: [.cave, .popArt],
            isGameOver: false
        )
        let mockedLoadGame: () -> GameState = {
            expectingLoadGameToBeCalled.fulfill()
            return mockedGameState
        }
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler) {
                $0.loadGame = mockedLoadGame
            }
        )
        store.assert(
            .send(.game(.load)) {
                $0.game = mockedGameState
            }
        )
        wait(for: [expectingLoadGameToBeCalled], timeout: 0.1)
    }

    func testClearBackup() {
        let expectingClearGameBackupToBeCalled = expectation(description: "Expect clear game backup to be called")
        let mockedClearGameBackup: () -> Void = {
            expectingClearGameBackupToBeCalled.fulfill()
        }
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler) {
                $0.clearGameBackup = mockedClearGameBackup
            }
        )
        store.assert(
            .send(.game(.clearBackup))
        )
        wait(for: [expectingClearGameBackupToBeCalled], timeout: 0.1)
    }
}
