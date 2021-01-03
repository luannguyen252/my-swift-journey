//
//  PlayerList.swift
//  FirstSwiftUIApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct PlayerList: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(players) {
                currentPlayer in
                NavigationLink(destination: PlayerDetail(player: currentPlayer)) {
                    PlayerRow(player: currentPlayer).frame(height:60)
                }
            } //: LIST
            .navigationBarTitle(Text("NBA Finals Players"))
        } //: NAVIGATION NEW
    }
}

// MARK: - PREVIEW
#if DEBUG
struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
    }
}
#endif
