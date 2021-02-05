import XCTest
@testable import MemoArt
import ComposableArchitecture

class ConfigurationCoreTests: XCTestCase {
    let scheduler = DispatchQueue.testScheduler

    func testUnselectArt() {
        let store = TestStore(
            initialState: ConfigurationState(),
            reducer: configurationReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.unselectArt(.cave)) {
                $0.selectedArts = Set(Art.allCases.filter({ $0 != .cave }))
            },
            .do { self.scheduler.advance(by: .seconds(2)) },
            .receive(.save)
        )
    }

    func testSelectArt() {
        let store = TestStore(
            initialState: .allArtsButCave,
            reducer: configurationReducer,
            environment: ConfigurationEnvironment(
                mainQueue: scheduler.eraseToAnyScheduler(),
                save: { _ in },
                load: { ConfigurationState() }
            )
        )
        store.assert(
            .send(.selectArt(.cave)) {
                $0.selectedArts = Set(Art.allCases)
            },
            .do { self.scheduler.advance(by: .seconds(2)) },
            .receive(.save)
        )
    }

    func testUnselectArtWhenThereIsOnlyTenRemainingSelectedArts() {
        let store = TestStore(
            initialState: .onlyTenSelectedArts,
            reducer: configurationReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.unselectArt(.cave))
        )
        // Do not receive .save here, it's not necessary
    }

    func testChangeDifficultyLevelToHard() {
        let store = TestStore(
            initialState: ConfigurationState(),
            reducer: configurationReducer,
            environment: ConfigurationEnvironment(
                mainQueue: scheduler.eraseToAnyScheduler(),
                save: { _ in },
                load: { ConfigurationState() }
            )
        )
        store.assert(
            .send(.changeDifficultyLevel(.hard)) {
                $0.difficultyLevel = .hard
            },
            .receive(.save)
        )
    }

    func testChangeDifficultyWhenUnselectedArtsCountReachedOverTheLimit() {
        let store = TestStore(
            initialState: .onlyTenSelectedArts,
            reducer: configurationReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            // Hard level needs more selected arts than the limit of Normal level
            // We need now to select some default arts to reach the correct limit
            .send(.changeDifficultyLevel(.hard)) {
                $0.difficultyLevel = .hard
                $0.selectedArts = Set(Art.allCases.prefix(12))
            },
            .receive(.save)
        )
    }

    func testPresentAndHideConfiguration() {
        let store = TestStore(
            initialState: ConfigurationState(),
            reducer: configurationReducer,
            environment: .mocked(scheduler: scheduler)
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

extension ConfigurationState {
    static var allArtsButCave: Self {
        ConfigurationState(
            selectedArts: Set(Art.allCases.filter({ $0 != .cave }))
        )
    }

    static var onlyTenSelectedArts: Self {
        ConfigurationState(
            selectedArts: Set(Art.allCases.prefix(10))
        )
    }
}

extension ConfigurationEnvironment {
    static func mocked(scheduler: TestSchedulerOf<DispatchQueue>) -> Self {
        ConfigurationEnvironment(
            mainQueue: scheduler.eraseToAnyScheduler(),
            save: { _ in },
            load: { ConfigurationState() }
        )
    }
}
