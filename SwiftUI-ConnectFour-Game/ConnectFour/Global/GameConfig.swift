//
//  PlayerConfig.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct GameConfig {
    let playerOneConfig: PlayerConfig
    let playerTwoConfig: PlayerConfig
    let columns: Int
    let rows: Int
    let tilesToWin: Int
    let primaryColor: Color
    let secondaryColor: Color
    let backgroundImage: Image
}


