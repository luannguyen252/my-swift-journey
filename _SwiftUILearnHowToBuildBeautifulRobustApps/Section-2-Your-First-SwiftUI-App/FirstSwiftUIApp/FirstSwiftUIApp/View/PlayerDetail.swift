//
//  PlayerDetail.swift
//  FirstSwiftUIApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct PlayerDetail: View {
    // MARK: - PROPERTIES
    var player: Player
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(player.team.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(player.imageName)
                .clipShape(Circle())
                .background(Circle()
                .foregroundColor(.white))
                .overlay(Circle()
                .stroke(Color.white, lineWidth: 4))
                .offset(x:0, y: -90)
                .padding(.bottom, -70)
                .shadow(radius: 15)
            
            Text(player.name)
                .font(.system(size: 50))
                .fontWeight(.heavy)
            
            StatText(statName: "Age", statValue: "\(player.age)")
            StatText(statName: "Height", statValue: player.height)
            StatText(statName: "Weight", statValue: "\(player.weight)lbs")
            
            Spacer()
        } //: VSTACK
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct PlayerDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetail(player: players[1])
    }
}
#endif
