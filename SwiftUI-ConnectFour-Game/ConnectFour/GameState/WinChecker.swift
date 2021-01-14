//
//  WinChecker.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 14.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

/// A Type that checks whether the game is concluded for the `winningTile`, `board`,  and `moveCount` once a new move has been made
struct WinChecker {

    let board: Board
    let winningTile: Tile
    let moveCount: Int
    let tilesToWin: Int
    var result: GameResult? {
        return checkEndGame()
    }
    
    /// Checks for all possible horizontal, vertical and diagnol wins. Returns `.inProgress` if win or draw are not reached
    private func checkEndGame() -> GameResult? {
        let horizontals = board.tilesFor(row: winningTile.row)
        let verticals = board.tilesFor(column: winningTile.column)
        let diagnolsAscending = board.tilesFor(diagnol: .acending, column: winningTile.column, row: winningTile.row)
        let diagnolsDescending = board.tilesFor(diagnol: .descending, column: winningTile.column, row: winningTile.row)
        if winningTiles(horizontals) || winningTiles(verticals) || winningTiles(diagnolsAscending) || winningTiles(diagnolsDescending) {
             return .win(winningTile.state)
        }
        if moveCount == board.tileCount {
            return .draw
        }
        return nil
    }
    
    /// Checks for four consecutive tiles matching `winningTile`
    /// - Parameter tiles: The possible winning tiles
    private func winningTiles(_ tiles: [Tile]) -> Bool {
        guard tiles.count >= tilesToWin else { return false }
        var count = 0
        var isWin = false
        tiles.forEach { (t) in
            count = t.state == winningTile.state ? count + 1 : 0
            if count == tilesToWin {
                isWin = true
            }
        }
        return isWin
    }
}
