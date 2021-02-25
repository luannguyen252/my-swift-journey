//
//  PlayerList.swift
//  NBA Player Fun
//
//  Created by zappycode on 6/4/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct PlayerList : View {
    var body: some View {
        NavigationView {
            List(players) {
                player in
                NavigationButton(destination: PlayerView(player: player)) {
                    PlayerRow(player: player)
                }
                }.navigationBarTitle(Text("NBA Finals Players"), displayMode: .large)
        }
    }
}

#if DEBUG
struct PlayerList_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            PlayerList().previewDevice("iPhone XS Max").environment(\.sizeCategory, .extraLarge).previewDisplayName("SE Large Text")
            PlayerList().previewDevice("iPhone SE").environment(\.sizeCategory, .extraLarge).previewDisplayName("SE Large Text")
        }
    }
}
#endif
