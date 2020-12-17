//
//  ContentView.swift
//  DetectShakeGestures
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var rolledNumber = 1
    @State var rolledIt = false
    
    var body: some View {
        VStack {
            Image(rolledIt ? "\(rolledNumber)" : "unknown")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .padding(.top, 250)
            Spacer()
            Text("Shake device to roll the dice!")
                .padding(.bottom, 40)
            Spacer()
        }
    }
    
    func rollDice() {
        let randomNumber = Int.random(in: 1 ..< 7)
        self.rolledNumber = randomNumber
        self.rolledIt = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RollButtonContent: View {
    var body: some View {
        Text("Roll the dice")
            .frame(width: 240, height: 75)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.orange)
            .cornerRadius(20)
    }
}
