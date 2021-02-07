import XCTest
@testable import MixTeam
import SwiftUI

class MixTeamLogicTests: XCTestCase {
    func testMixTeamWhenThereIsMoreThan2TeamsAvailableAndMixTeamThenNoAlertIsPresented() throws {
        let teamsStore = TeamsStore()
        teamsStore.teams = .exampleTeam
        var presentedAlert: MainView.PresentedAlert?
        let playersLogic = MockedPlayersLogic(teamsStore: teamsStore) {
            presentedAlert = $0
        }

        XCTAssertNil(presentedAlert)
        playersLogic.mixTeam()
        XCTAssertNil(presentedAlert)
    }

    func testMixTeamWhenThereIsMoreThan2TeamsAvailableAndMixTeamThenPlayersAreMixed() throws {
        let teamsStore = TeamsStore()
        teamsStore.teams = .exampleTeam
        let playersLogic = MockedPlayersLogic(teamsStore: teamsStore)

        XCTAssertEqual(teamsStore.teams.first?.players.count, 2)
        XCTAssertEqual(teamsStore.teams[1].players.count, 1)
        XCTAssertEqual(teamsStore.teams[2].players.count, 0)
        playersLogic.mixTeam()
        XCTAssertEqual(teamsStore.teams.first?.players.count, 0)
        XCTAssertGreaterThan(teamsStore.teams[2].players.count, 0)
    }

    func testMixTeamWhenThereIsLessThan2TeamsAvailableAndMixTeamThenAlertIsPresented() throws {
        let teamsStore = TeamsStore()
        teamsStore.teams = []
        var presentedAlert: MainView.PresentedAlert?
        let playersLogic = MockedPlayersLogic(teamsStore: teamsStore) {
            presentedAlert = $0
        }

        XCTAssertNil(presentedAlert)
        playersLogic.mixTeam()
        XCTAssertEqual(presentedAlert, .notEnoughTeams)
    }
}

struct MockedPlayersLogic: MixTeamLogic {
    var teamsStore: TeamsStore = TeamsStore()
    var mockedPresentedAlertSet: (MainView.PresentedAlert?) -> Void = { _ in }

    var presentedAlertBinding: Binding<MainView.PresentedAlert?> {
        .init(
            get: { nil },
            set: { self.mockedPresentedAlertSet($0) }
        )
    }
}
