//
//  GameState.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

enum GameState: Equatable {

    case playerOneTurn
    case playerTwoTurn
    case gameOver(GameResult)

    var currentTile: TileState {
        switch self {
        case .playerOneTurn:
            return .playerOne
        case .playerTwoTurn:
            return .playerTwo
        default:
            return .vacant
        }
    }

    func nextTurn() -> GameState {
        switch self {
        case .playerOneTurn:
            return .playerTwoTurn
        case .playerTwoTurn:
            return .playerOneTurn
        default:
            fatalError("Something went wrong game is over")
        }
    }
}
