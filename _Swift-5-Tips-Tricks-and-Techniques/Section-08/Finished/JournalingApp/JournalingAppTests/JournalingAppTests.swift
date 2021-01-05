//
//  JournalingAppTests.swift
//  JournalingAppTests
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import XCTest
@testable import JournalingApp // explain this, very important

class JournalingAppTests: XCTestCase {

    var model: EntryModel!
    
    override class func setUp() {
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         model = EntryModel(entries: sampleEntries)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override class func tearDown() {
    }

    func testUniqueIds() {
        var ids: [String] = model.entries.compactMap { $0.id }
        //ids.append(ids[0])
        for id in ids {
            let count = ids.filter { $0 == id }.count
            XCTAssertEqual(1, count, "Found duplicate IDs")
        }
    }
    
    func testSortPerformance() {
        // This is an example of a performance test case.
        self.measure {
            for i in 0..<100 {
                let x = pow(10, i)
            }
        }
    }

}
