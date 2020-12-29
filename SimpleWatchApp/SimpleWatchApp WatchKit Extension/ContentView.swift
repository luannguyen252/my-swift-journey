//
//  ContentView.swift
//  SimpleWatchApp WatchKit Extension
//
//  Created by Luan Nguyen on 29/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State var isPlaying: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.orange), lineWidth: 4)
                .frame(width: 130, height: 130)
                .scaleEffect(self.isPlaying ? 1.3: 1.1)
                .opacity(self.isPlaying ? 0 : 1)
                .animation(
                    self.isPlaying ?
                        Animation.easeInOut(duration: 1)
                    : .default
            )
       
            Button(action: {
                self.isPlaying.toggle()
            }, label: {
                Text("Dring Dring")
                    .italic()
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(width: 130, height: 130)
                    .foregroundColor(Color(.white))
            })
            .buttonStyle(PlainButtonStyle())
            .background(Color(.orange))
            .clipShape(Circle())
        }
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isPlaying: true)
    }
}
