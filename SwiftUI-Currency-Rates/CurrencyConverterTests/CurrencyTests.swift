//
//  CurrencyTests.swift
//  CurrencyConverterTests
//
//  Created by Vincent Smithers on 11.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import XCTest
@testable import CurrencyConverter

class CurrencyTests: XCTestCase {
    
    func testCurrencyImages() {
        XCTAssertEqual(currencies.count, 10)
        currencies.forEach {
            XCTAssertNotNil($0.image, "Image is nil for \($0.symbol)")
        }
    }
    
    func testCurrencyTitles() {
        XCTAssertEqual(currencies.count, 10)
        currencies.forEach {
            XCTAssertGreaterThan($0.title.count, 0, "Title is empty for \($0.symbol)")
        }
    }
   
    func testCurrencyCode() {
        XCTAssertEqual(currencies.count, 10)
        currencies.forEach {
            print($0.code)
            XCTAssertEqual($0.code.count, 3)
        }
    }
}
