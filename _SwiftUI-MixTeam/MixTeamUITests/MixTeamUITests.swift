//
//  MixTeamUITests.swift
//  MixTeamUITests
//
//  Created by Renaud JENNY on 07/05/2017.
//  Copyright © 2017 Renaud JENNY. All rights reserved.
//

import XCTest

class MixTeamUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testAddTeam() {
        let app = XCUIApplication()

        app.buttons["Add Team"].tap()

        app.buttons["Edit Team Purple Elephant"].tap()

        app.buttons["koala"].tap()

        app.buttons["red color"].tap()

        let yourTeamNameTextField = app.textFields["Edit"]
        yourTeamNameTextField.tap()
        yourTeamNameTextField.typeText("Red Koalas\n")
        app.buttons["Done"].tap()
    }
}
