//
//  PlayerRow.swift
//  NBA Player Fun
//
//  Created by zappycode on 6/4/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct PlayerRow : View {
    
    var player: Player
    
    var body: some View {
        HStack {
            Image(player.imageName).resizable().frame(width: 50.0, height: 50.0).scaledToFit().background(Circle().foregroundColor(player.team.color)).clipShape(Circle())
            Text(player.name).font(.largeTitle).minimumScaleFactor(0.5)
            Spacer()
        }
    }
}

#if DEBUG
struct PlayerRow_Previews : PreviewProvider {
    static var previews: some View {
        PlayerRow(player: players[0]).previewLayout(.fixed(width: 500, height: 100))
        
    }
}
#endif
