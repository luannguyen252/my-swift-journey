//
//  Column.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct Column: View {

    let tiles: [Tile]
    
    private var distanceOffset: CGFloat {
        let spaces = tiles.filter({ $0.state == .vacant }).count
        return CGFloat(abs((spaces * 2) - 1))
    }
    
    var body: some View {
        ForEach(tiles) { tile in
            if tile.state == .vacant {
                RoundTile(state: tile.state)
            } else {
                GeometryReader { geometry in
                    DroppingTile(tileState: tile.state,
                                 distance: geometry.size.height * self.distanceOffset)
                }
            }
        }
    }
}


