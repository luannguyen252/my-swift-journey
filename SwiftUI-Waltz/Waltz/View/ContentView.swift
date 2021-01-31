//
//  ContentView.swift
//  Waltz
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var model: WaltzModel
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                SongCard(title: "Waltz of the Flowers", composer: "Tchaikovsky", image: "childhood")
                    .padding(.all, 30)
                
                HStack {
                    Button(action: { model.playMusic() }) {
                        Image(systemName: "play.circle")
                            .font(.largeTitle)
                            .foregroundColor(Color(.systemGray3))
                    }
                    Button(action: { model.pauseMusic() }) {
                        Image(systemName: "pause.circle")
                            .font(.largeTitle)
                            .foregroundColor(Color(.systemGray3))
                    }
                    Button(action: { model.stopMusic() }) {
                        Image(systemName: "stop.circle")
                            .font(.largeTitle)
                            .foregroundColor(Color(.systemGray3))
                    }
                } //: HSTACK
            } //: VSTACK
            .navigationTitle(Text("Waltz"))
        }
    }
}
