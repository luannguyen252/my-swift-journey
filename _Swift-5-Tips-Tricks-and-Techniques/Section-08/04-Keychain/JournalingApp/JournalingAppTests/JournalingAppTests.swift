//
//  JournalingAppTests.swift
//  JournalingAppTests
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import XCTest
@testable import JournalingApp

class JournalingAppTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUniqueIds() {
        let entryModel = EntryModel(entries: sampleEntries)
        let ids: [String] = entryModel.entries.compactMap { $0.id }
        for id in ids {
            let count = ids.filter { $0 == id }.count
            XCTAssertEqual(1, count, "Found duplicate ids")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            for i in 0..<100000 {
                let x = pow(10, i)
            }
        }
    }

}
