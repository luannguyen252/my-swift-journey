//
//  Copyright © 2019 An Tran. All rights reserved.
//

import XCTest

class PixabayMVVMSwiftUICombineUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testUserCanSearchForImages() {
        let app = XCUIApplication()
        app.textFields["search term"].tap()
        app.buttons["Search"].tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        XCTAssert(app.navigationBars["Detail"].staticTexts["Detail"].isHittable)
    }

}
