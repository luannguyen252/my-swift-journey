//
//  SwipebleViewExampleUITests.swift
//  SwipebleViewExampleUITests
//
//  Created by Ilya on 10.10.20.
//

import XCTest

class SwipebleViewExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUIComponent() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
                app.launch()
        
        let swipeToSeeActions1StaticText = app.staticTexts["Swipe to see actions 1"]
        swipeToSeeActions1StaticText.swipeLeft()
        sleep(1)
        app.buttons["Note"].tap()
        sleep(1)
        
        swipeToSeeActions1StaticText.tap()
        // Button should be hidden after tapping
        XCTAssert(!app.buttons["Note"].exists)
        
        let swipeToSeeActionsStaticText2 = app.staticTexts["Swipe to see actions 2"]
        swipeToSeeActionsStaticText2.swipeRight()
        
        let swipeToSeeActionsStaticText = app.staticTexts["Swipe to see actions"]
        sleep(1)
        swipeToSeeActionsStaticText.swipeRight()
        sleep(1)
        XCTAssert(app.buttons["Delete"].exists)
        XCTAssert(app.buttons.count == 2 )
        
        app.buttons.firstMatch.tap()
        sleep(1)
        
        XCTAssert(app.buttons.count == 1)
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
