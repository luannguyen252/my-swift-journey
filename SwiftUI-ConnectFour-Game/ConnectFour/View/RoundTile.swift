//
//  Tile.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct RoundTile: View {

    @State private var expand = true
    let state: TileState
    private let animations = TileAnimations()
    private var shouldAnimate: Bool {
        return state != .vacant && expand
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(state.color)
            Circle()
                .stroke(config.primaryColor, lineWidth: 3)
            state.image
                .foregroundColor(config.secondaryColor)
        }
        .scaleEffect(shouldAnimate ? 1.5: 1.0)
        .opacity(shouldAnimate ? 0.1 : 1.0)
        .animation(animations.dropAnimation).onAppear {
            if self.shouldAnimate {
                self.expand = false
            }
        }
    }
}
