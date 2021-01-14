//
//  BoardTests.swift
//  ConnectFourTests
//
//  Created by Vincent Smithers on 15.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import XCTest
@testable import ConnectFour

class BoardTests: XCTestCase {

    var board = Board(columns: 7, rows: 6)

    override func setUp() {}

    override func tearDown() {}

    func testBoard() {
        XCTAssertEqual(board.tileCount, 42)
        XCTAssertNotNil(board.tilesFor(column: 6))
        XCTAssertEqual(board.tilesFor(row: 1).count, 7)
        XCTAssertEqual(board.tilesFor(column: 1).count, 6)
    }

    func testHorizontal() {
        (0...6).forEach({board.addTile(inColumn: $0, forState: .playerOne)})
        let bottomRow = board.tilesFor(row: 0)
        bottomRow.forEach { (t) in
            XCTAssertEqual(t.state, .playerOne)
        }
    }

    func testVertical() {
        for _ in 0...7 {
            board.addTile(inColumn: 0, forState: .playerTwo)
        }
        let firstColumn = board.tilesFor(column: 0)
        firstColumn.forEach { (t) in
            XCTAssertEqual(t.state, .playerTwo)
        }
    }

    func testDiagnolAscending() {
        for count in 0...3 {
            for _ in 0...count {
                board.addTile(inColumn: count, forState: .playerTwo)
            }
        }
        let diagnolAscending = board.tilesFor(diagnol: .acending, column: 0, row: 0)
        diagnolAscending.forEach { (t) in
            XCTAssertEqual(t.state, .playerTwo)
        }
    }

    func testDiagnolDescending() {
        var count = 6
        for _ in 0...6 {
            for _ in 0...count {
                board.addTile(inColumn: count, forState: .playerOne)
            }
            count -= 1
        }
        let diagnolAscending = board.tilesFor(diagnol: .acending, column: 6, row: 5)
        diagnolAscending.forEach { (t) in
            print("\(t.column), \(t.row)")
            XCTAssertEqual(t.state, .playerOne)
        }
    }
}
