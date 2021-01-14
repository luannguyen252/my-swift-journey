//
//  Board.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 11.07.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct TransparentBoard: View {

    @EnvironmentObject var viewModel: BoardViewModel

    var body: some View {
        HStack {
            ForEach(0..<viewModel.board.columnCount) { columnIdx in
                VStack {
                    PulsingButton(tileState: self.viewModel.state.currentTile) {
                        self.viewModel.dropTile(inColumn: columnIdx)
                    }
                    Column(tiles: self.viewModel.tilesAt(index: columnIdx))
                }
            }
        }.background(Color.clear)
            .padding()
            .aspectRatio(1, contentMode: .fit)
    }
}
