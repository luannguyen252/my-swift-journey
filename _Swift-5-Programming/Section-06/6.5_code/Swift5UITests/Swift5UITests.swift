//
//  Swift5UITests.swift
//  Swift5UITests
//
//  Created by Kushal Ashok on 2020/3/2.
//  Copyright © 2020 com.kushalashok. All rights reserved.
//

import XCTest

class Swift5UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        sleep(2)
        app.buttons["getLocation"].tap()
        sleep(15)
        XCTAssertTrue(app.alerts.count > 0)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAppHasGetLocationButton() {
        let app = XCUIApplication()
        app.launch()
        sleep(2)
        let getButton = app.buttons["getLocation"]
        XCTAssert(getButton.exists)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
