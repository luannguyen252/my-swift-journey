#if os(macOS)
import XCTest

extension Marketing {
    func navigateToConfiguration() {
        app.buttons["configuration"].tap()
    }

    func selectDifficulty(levelIdentifier: String) {
        let buttonPosition: Int
        switch levelIdentifier {
        case "easy": buttonPosition = 0
        case "normal": buttonPosition = 1
        case "hard": buttonPosition = 2
        default: buttonPosition = -1
        }

        app.radioGroups["difficulty_level"].radioButtons.element(boundBy: buttonPosition).tap()
        app.buttons["done"].tap()
    }
}
#endif
