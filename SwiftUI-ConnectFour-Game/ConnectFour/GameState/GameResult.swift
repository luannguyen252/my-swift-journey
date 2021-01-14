//
//  GameResult.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 16.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

enum GameResult: Equatable {
    
    case win(TileState)
    case draw
    
    var winningTile: TileState {
        switch self {
        case .win(let state):
            return state
        case .draw:
            return .vacant
        }
    }
    
    var title: String {
        switch self {
        case .win(let state):
            switch state {
            case .playerOne:
                return "Player One Wins"
            case .playerTwo:
                return "Player Two Wins"
            default:
                fatalError("Winning Tile Cannot Be Vacant!")
            }
        case .draw:
            return "Draw!!"
        }
    }
}
