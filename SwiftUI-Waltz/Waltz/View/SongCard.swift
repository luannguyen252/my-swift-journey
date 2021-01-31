//
//  SongCard.swift
//  Waltz
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct SongCard: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var model: WaltzModel
    
    let title: String
    let composer: String
    let image: String
    
    @State var isTapped: Bool = false
    
    // MARK: - BODY
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
                } //: VSTACK
            } //: ZSTACK
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(ScaleButtonStyle())
    }
}
