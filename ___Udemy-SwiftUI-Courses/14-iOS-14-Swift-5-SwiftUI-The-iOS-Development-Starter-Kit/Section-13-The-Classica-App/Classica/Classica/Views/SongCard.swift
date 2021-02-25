//
//  SongCard.swift
//  Classica
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI

struct SongCard: View {
    
    @EnvironmentObject var model: ClassicaModel
    
    let title: String
    let composer: String
    let image: String
    let type: String
    
    var body: some View {
        
        Button(action: {
            self.model.loadAndPlay(song: title, fileType: type)
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
