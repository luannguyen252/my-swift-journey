//
//  Config.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 27.09.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI


let config = GameConfig(playerOneConfig: PlayerConfig(color: .orange, image: Image(systemName: "tortoise")),
                        playerTwoConfig: PlayerConfig(color: .blue, image: Image(systemName: "hare")),
                        columns: 7,
                        rows: 6,
                        tilesToWin: 4,
                        primaryColor: .purple,
                        secondaryColor: .white,
                        backgroundImage: Image("wallpaper"))
