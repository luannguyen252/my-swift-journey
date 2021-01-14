//
//  WinCheckerTests.swift
//  ConnectFourTests
//
//  Created by Vincent Smithers on 15.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import XCTest
@testable import ConnectFour

/// Tests for a standard game of connect four; 7x6 board with four consecutive tiles to win
class StandardGameWinCheckerTests: XCTestCase {
    
    private let tilesToWin = 4

    func testDraw() {
        let tile = Tile(column: 6, row: 5, state: .playerOne)
        let checkForWin = WinChecker(board: makeBoard(), winningTile: tile, moveCount: 42, tilesToWin: tilesToWin)
        XCTAssertEqual(checkForWin.result, GameResult.draw)
    }

    func testHorizontalWin() {
        var board = makeBoard()
        (0...5).forEach({board.addTile(inColumn: $0, forState: .playerOne)})
        guard let winningTile = board.addTile(inColumn: 6, forState: .playerOne) else { fatalError() }
        let checkForWin = WinChecker(board: board, winningTile: winningTile, moveCount: 6, tilesToWin: tilesToWin)
        XCTAssertEqual(checkForWin.result, GameResult.win(.playerOne))
    }

    func testVerticalWin() {
        var board = makeBoard()
        for _ in 0...tilesToWin {
            board.addTile(inColumn: 0, forState: .playerTwo)
        }
        guard let winningTile = board.addTile(inColumn: 0, forState: .playerTwo) else { fatalError() }
        let checkForWin = WinChecker(board: board, winningTile: winningTile, moveCount: 5, tilesToWin: tilesToWin)
        XCTAssertEqual(checkForWin.result, GameResult.win(.playerTwo))
    }

    func testDiagnolWinAscending() {
        var board = makeBoard()
        for count in 0...3 {
            for _ in 0...count {
                board.addTile(inColumn: count, forState: .playerTwo)
            }
        }
        guard let winningTile = board.addTile(inColumn: 3, forState: .playerTwo) else { fatalError() }
        let checkForWin = WinChecker(board: board, winningTile: winningTile, moveCount: 11, tilesToWin: tilesToWin)
        XCTAssertEqual(checkForWin.result, GameResult.win(.playerTwo))
    }

    func testDiagnolWinDescending() {
        var board = makeBoard()
        var count = 6
        for _ in 0...tilesToWin {
            for _ in 0...count {
                board.addTile(inColumn: count, forState: .playerOne)
            }
            count -= 1
        }
        board.addTile(inColumn: 1, forState: .playerOne)
        guard let winningTile = board.addTile(inColumn: 1, forState: .playerOne) else { fatalError() }
        let checkForWin = WinChecker(board: board, winningTile: winningTile, moveCount: 25, tilesToWin: tilesToWin)
        XCTAssertEqual(checkForWin.result, GameResult.win(.playerOne))
    }
    
    private func makeBoard() -> Board {
        return Board(columns: 7, rows: 6)
    }
}
