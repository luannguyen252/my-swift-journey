#if os(iOS)
import XCTest

extension Marketing {
    func navigateToConfiguration() {
        // Bizarrely, I can't get the navigation buttons by their accessibility identifiers on iOS...
        // so I have to workaround with the number of this button
        // Configuration button
        if app.buttons["configuration"].exists {
            app.buttons["configuration"].tap()
        } else {
            // The workaround, remove this when the iOS bug is fixed.
            app.navigationBars.buttons.element(boundBy: 1).tap()
        }

        guard app.scrollViews["configuration"].waitForExistence(timeout: 1) else {
            XCTFail("Cannot go to configuration")
            return
        }
    }

    func selectDifficulty(levelIdentifier: String) {
        let buttonPosition: Int
        switch levelIdentifier {
        case "easy": buttonPosition = 0
        case "normal": buttonPosition = 1
        case "hard": buttonPosition = 2
        default: buttonPosition = -1
        }
        // It seems this bug is the same for the segmentedControls...
        // I should be able to access with easy/normal/hard identifier and not the position!
        app.segmentedControls["difficulty_level"].buttons.element(boundBy: buttonPosition).tap()
        // Back button, not ideal as well...
        app.navigationBars.firstMatch.buttons.firstMatch.tap()

        guard app.navigationBars.staticTexts["MemoArt"].waitForExistence(timeout: 1) else {
            XCTFail("Back button didn't work, impossible to go back in the main screen")
            return
        }
    }
}
#endif
