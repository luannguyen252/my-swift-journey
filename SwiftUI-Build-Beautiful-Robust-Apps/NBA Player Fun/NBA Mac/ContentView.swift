//
//  ContentView.swift
//  NBA Mac
//
//  Created by zappycode on 6/22/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        List(players) {
            player in
                PlayerRow(player: player)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
