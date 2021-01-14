//
//  ConnectFourUITests.swift
//  ConnectFourUITests
//
//  Created by Vincent Smithers on 24.09.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import XCTest

class ConnectFourUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func testIncompleteGame() {
        let app = XCUIApplication()
        app.launch()
        (0...2).forEach { _ in
            (0...6).forEach {
                app.buttons.element(boundBy: $0).tap()
            }
        }
    }
    
    func testPlayerOneWin() {
        let app = XCUIApplication()
        app.launch()
        (0...2).forEach { _ in
            app.buttons.element(boundBy: 0).tap()
            app.buttons.element(boundBy: 1).tap()
        }
        app.buttons.element(boundBy: 0).tap()
        XCTAssert(app.staticTexts["Player One Wins"].isHittable)
    }
    
    func testPlayerTwoWin() {
       let app = XCUIApplication()
       app.launch()
       (0...2).forEach { _ in
           app.buttons.element(boundBy: 0).tap()
           app.buttons.element(boundBy: 1).tap()
       }
       app.buttons.element(boundBy: 5).tap()
       app.buttons.element(boundBy: 1).tap()
       XCTAssert(app.staticTexts["Player Two Wins"].isHittable)
    }
    
    func testDraw() {
        let app = XCUIApplication()
        app.launch()
        (0...2).forEach { _ in
           app.buttons.element(boundBy: 0).tap()
           app.buttons.element(boundBy: 2).tap()
           app.buttons.element(boundBy: 4).tap()
           app.buttons.element(boundBy: 6).tap()
        }
        (0...2).forEach { _ in
            app.buttons.element(boundBy: 1).tap()
            app.buttons.element(boundBy: 3).tap()
            app.buttons.element(boundBy: 5).tap()
        }
        (0...2).forEach { _ in
            app.buttons.element(boundBy: 0).tap()
            app.buttons.element(boundBy: 2).tap()
            app.buttons.element(boundBy: 4).tap()
            app.buttons.element(boundBy: 6).tap()
        }
        (0...2).forEach { _ in
           app.buttons.element(boundBy: 1).tap()
           app.buttons.element(boundBy: 3).tap()
           app.buttons.element(boundBy: 5).tap()
        }
        XCTAssert(app.staticTexts["Draw!!"].isHittable)
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
