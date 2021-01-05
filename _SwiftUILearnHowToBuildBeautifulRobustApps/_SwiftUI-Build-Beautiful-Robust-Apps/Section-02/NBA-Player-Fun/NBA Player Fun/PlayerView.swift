//
//  PlayerView.swift
//  NBA Player Fun
//
//  Created by zappycode on 6/4/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct PlayerView : View {
    
    var player: Player
    
    var body: some View {
        VStack {
        Image(player.team.imageName).resizable().frame(height: 250)
            
            Image(player.imageName)
                .clipShape(Circle()).background(Circle().foregroundColor(.white))
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 15).offset(x: 0, y: -90).padding(.bottom, -90)
            
            Text(player.name)
                .font(.system(size:50))
            .fontWeight(.bold)
            
            StatText(statName: "Age", statValue: String(player.age))
            StatText(statName: "Height", statValue: player.height)
            StatText(statName: "Weight", statValue: String(player.weight) + "lbs")
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        PlayerView(player: players[0])
    }
}
#endif
