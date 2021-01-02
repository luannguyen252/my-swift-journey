//
//  ContentView.swift
//  RollTheDice
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var rollNumber = 1
    @State var rolledIt = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // Dice image
            Image(rolledIt ? "\(rollNumber)" : "unknown")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()
                .padding(.top, 250)
            
            Spacer()
            
            // Roll the dice button
            Button(action: {
                let randomNumber = Int.random(in: 1 ..< 7)
                rollNumber = randomNumber
                rolledIt = true
            }) {
                RollTheDice()
            }
            .padding(.bottom, 40)
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
