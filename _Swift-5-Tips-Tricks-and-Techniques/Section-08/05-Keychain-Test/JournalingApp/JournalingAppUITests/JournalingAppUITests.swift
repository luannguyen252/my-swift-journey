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
        
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars["Entries"].buttons["plus"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.textFields.matching(identifier: "title").element.tap()
        app.typeText("Entry") // no hardware keyboard set on simulator
        
        tablesQuery.textFields.matching(identifier: "entry").element.tap()
        
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
        
        app.typeText("Text") // no hardware keyboard set on simulator
        app.navigationBars["Create Entry"].buttons["Save"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Entry\n3/15/20\nText"]/*[[".cells.buttons[\"Entry\\n3\/15\/20\\nText\"]",".buttons[\"Entry\\n3\/15\/20\\nText\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Entry"].buttons["Entries"].tap()
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
