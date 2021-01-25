//
//  Cell.swift
//  Connect 3 Game
//
//  Created by Sergey Sevriugin on 25/12/2019.
//  Copyright © 2019 Sergey Sevriugin. All rights reserved.
//

import Foundation

enum Party: String {
    case me = "yellow"
    case you = "red"
    case nobody = "nobody"
    case empty = ""
}

struct Cell: Hashable {
    var id : Int { row * 100 + col }
    var party: Party
    var row: Int
    var col: Int
}
