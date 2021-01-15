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
            
            Image(player.imageName).resizable().scaledToFit()
                .clipShape(Circle()).background(Circle().foregroundColor(.white))
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 15).offset(x: 0, y: -90).padding(.bottom, -90)
            
            Text(player.name)
                .font(.system(size:50))
                .fontWeight(.bold)
                .padding(.horizontal)
                .minimumScaleFactor(0.5)
            
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
        Group {
            PlayerView(player: players[2]).previewDevice("iPhone XS Max").environment(\.sizeCategory, .extraLarge).previewDisplayName("XS MAX Large Text")
            
            PlayerView(player: players[2]).previewDevice("iPhone XS Max").environment(\.sizeCategory, .extraSmall).previewDisplayName("XS MAX Small Text")
            
            PlayerView(player: players[2]).previewDevice("iPhone SE").environment(\.sizeCategory, .extraLarge).previewDisplayName("SE Large Text")
            
            PlayerView(player: players[2]).previewDevice("iPhone SE").environment(\.sizeCategory, .extraSmall).previewDisplayName("SE Small Text")
        }
    }
}
#endif
