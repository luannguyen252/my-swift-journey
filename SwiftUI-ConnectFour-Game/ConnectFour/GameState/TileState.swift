//
//  TileState.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation
import SwiftUI

enum TileState {

    case playerOne
    case playerTwo
    case vacant

    var color: Color {
        switch self {
        case .playerOne:
            return config.playerOneConfig.color
        case .playerTwo:
            return config.playerTwoConfig.color
        case .vacant:
            return .clear
        }
    }

    var image: Image {
        switch self {
        case .playerOne:
            return config.playerOneConfig.image
        case .playerTwo:
            return config.playerTwoConfig.image
        case .vacant:
            return Image(uiImage: UIImage())
        }
    }
}
