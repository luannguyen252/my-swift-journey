//
//  ContentView.swift
//  NBA TV
//
//  Created by zappycode on 6/22/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        ScrollView {
            HStack {
                ForEach(players) {
                    player in
                    VStack {
                        Image(player.imageName).resizable().frame(width: 500.0, height: 500.0).scaledToFit().background(Circle().foregroundColor(player.team.color)).clipShape(Circle())
                        Text(player.name).font(.largeTitle).minimumScaleFactor(0.5).foregroundColor(.white)
                        Spacer()
                    }.padding().background(Color.blue).cornerRadius(40)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
