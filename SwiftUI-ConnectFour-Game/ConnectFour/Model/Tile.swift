//
//  Tile.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 30.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

struct Tile: Identifiable {
    let column: Int
    let row: Int
    var state: TileState
    var id = UUID()
}
