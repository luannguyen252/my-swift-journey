//
//  DroppingTile.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 26.09.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct DroppingTile: View {
    
    @State private var dropped = false
    let tileState: TileState
    let distance: CGFloat
    private let tileAnimations = TileAnimations()
    
    var body: some View {
        ZStack {
            RoundTile(state: tileState)
                .offset(x: 0, y: dropped ? 0 : -distance)
                .animation(tileAnimations.dropAnimation)
                .onAppear {
                self.dropped = true
            }
            RoundTile(state: .vacant)
        }
    }
}
