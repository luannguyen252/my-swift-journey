import XCTest

class Marketing: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["--reset-game-backup", "--use-predicted-arts", "--reset-configuration"]
        app.launch()

        if app.buttons[XCUIIdentifierFullScreenWindow].exists {
            app.buttons[XCUIIdentifierFullScreenWindow].tap()
        }
    }

    func testGameScreenshot() throws {
        app.buttons["card number 0"].tap()
        app.buttons["card number 1"].tap()
        app.buttons["card number 2"].tap()
        app.buttons["card number 3"].tap()
        app.buttons["card number 0"].tap()
        app.buttons["card number 1"].tap()
        app.buttons["card number 2"].tap()
        app.buttons["card number 3"].tap()
        app.buttons["card number 1"].tap()
        app.buttons["card number 11"].tap()
        app.buttons["card number 3"].tap()
        app.buttons["card number 13"].tap()
        app.buttons["card number 4"].tap()
        app.buttons["card number 14"].tap()
        app.buttons["card number 2"].tap()
        app.buttons["card number 5"].tap()

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testConfigurationScreenshot() throws {
        navigateToConfiguration()

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testEasyDifficultyScreenshot() throws {
        navigateToConfiguration()

        selectDifficulty(levelIdentifier: "easy")

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testHardDifficultyScreenshot() throws {
        navigateToConfiguration()
        selectDifficulty(levelIdentifier: "hard")

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
