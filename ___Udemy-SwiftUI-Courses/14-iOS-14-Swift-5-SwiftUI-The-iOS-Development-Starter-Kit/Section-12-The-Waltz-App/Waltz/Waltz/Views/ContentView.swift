//
//  ContentView.swift
//  Waltz
//
//  Created by Pao Yu on 2020-08-04.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: WaltzModel
    
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
                }
            }   .navigationTitle(Text("Waltz"))
        }
    }
}
