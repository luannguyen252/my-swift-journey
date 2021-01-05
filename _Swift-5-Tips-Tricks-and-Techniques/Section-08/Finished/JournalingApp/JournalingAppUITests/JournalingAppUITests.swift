//
//  JournalingAppUITests.swift
//  JournalingAppUITests
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import XCTest

class JournalingAppUITests: XCTestCase {

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

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        app.navigationBars["Entries"].buttons["plus"].tap()
        
        // IMPORTANT, disconnet hardware keyboard!!
        let tablesQuery = app.tables
        
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Title"]/*[[".cells.textFields[\"Title\"]",".textFields[\"Title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.textFields.matching(identifier: "title").element.typeText("Entry")
        tablesQuery.textFields["Entry text"].tap()
        tablesQuery.textFields.matching(identifier: "entry").element.typeText("This is my entry text")
        
        app.navigationBars["Create Entry"].buttons["Save"].tap()
        
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
        
        //tablesQuery.buttons["Entry\n3/14/20\nThis is my entry text"].tap()
        XCTAssertTrue(tablesQuery.buttons.element(boundBy: 0).exists)
        tablesQuery.buttons.element(boundBy: 0).tap()

        app.navigationBars["Entry"].buttons["Entries"].tap()
        tablesQuery.element.swipeDown()
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
