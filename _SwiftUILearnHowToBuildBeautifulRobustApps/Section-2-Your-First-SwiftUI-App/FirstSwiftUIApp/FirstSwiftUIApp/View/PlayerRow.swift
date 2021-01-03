//
//  PlayerRow.swift
//  FirstSwiftUIApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct PlayerRow: View {
    // MARK: - PROPERTIES
    var player: Player
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(player.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .background(Circle()
                .foregroundColor(player.team.color))
            
            Text(player.name)
                .font(.title3)
            
            Spacer()
        } //: HSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: players[0]).previewLayout(.fixed(width: 500, height: 100))
    }
}
#endif
