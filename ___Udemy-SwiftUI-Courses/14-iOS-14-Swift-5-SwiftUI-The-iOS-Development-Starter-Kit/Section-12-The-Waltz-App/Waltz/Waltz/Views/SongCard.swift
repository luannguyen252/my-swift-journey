//
//  SongCard.swift
//  Waltz
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI

struct SongCard: View {
    
    @EnvironmentObject var model: WaltzModel
    
    let title: String
    let composer: String
    let image: String
    
    @State var isTapped: Bool = false
    
    var body: some View {
        
        Button(action: {
            self.model.loadMusic()
            self.model.playMusic()
        }) {
            ZStack {
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack {
                    
                    HStack {
                        SongInfo(title: title, composer: composer)
                        Spacer()
                    }
                    Spacer()
                    
                }
                
            }   .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }       .buttonStyle(ScaleButtonStyle())
    }
}
