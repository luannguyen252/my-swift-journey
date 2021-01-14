//
//  BoardViewModel.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI
import Combine

final class BoardViewModel: ObservableObject {
    
    @Published var board: Board
    private let tilesToWin: Int
    private var moveCount = 0
    var state: GameState = .playerOneTurn
    
    init(board: Board, tilesToWin: Int) {
        self.board = board
        self.tilesToWin = tilesToWin
    }
    
    func tilesAt(index: Int) -> [Tile] {
        board.tilesFor(column: index).reversed()
    }
    
    func dropTile(inColumn column: Int) {
        if let tile = board.addTile(inColumn: column, forState: state.currentTile) {
            moveCount += 1
            updateState(newTile: tile)
        }
    }

    private func updateState(newTile: Tile) {
        let winCheckResult = WinChecker(board: board, winningTile: newTile, moveCount: moveCount, tilesToWin: tilesToWin).result
        switch winCheckResult {
        case .win(let tileState):
            state = .gameOver(.win(tileState))
        case .draw:
            state = .gameOver(.draw)
        case .none:
            state = state.nextTurn()
        }
    }
}

extension BoardViewModel {
    func resetGame() {
        board = Board(columns: config.columns, rows: config.rows)
        state = .playerOneTurn
        moveCount = 0
    }
}
