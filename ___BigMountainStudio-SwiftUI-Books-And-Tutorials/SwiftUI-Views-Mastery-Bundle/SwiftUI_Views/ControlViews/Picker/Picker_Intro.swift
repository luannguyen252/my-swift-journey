//
//  Picker_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Picker_Intro : View {
    @State private var favoriteState = 1
    @State private var yourName = "Mark"
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Picker")
                .font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("You associate a variable with the picker rows' tag values")
                .frame(maxWidth: .infinity).padding().font(.title)
                .background(Color("AccentColorDark"))
                .foregroundColor(Color.white)
            
            Picker(selection: $favoriteState, label: Text("States")) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
            }
            .padding(.horizontal)
            .frame(height: 180)
            
            Text("Tag values can be String, Int or Bool.")
                .frame(maxWidth: .infinity).padding().font(.title)
                .background(Color("AccentColorDark"))
                .foregroundColor(Color.white)
            
            Picker(selection: $yourName, label: Text("Your name")) {
                Text("Paul").tag("Paul")
                Text("Chris").tag("Chris")
                Text("Mark").tag("Mark")
                Text("Scott").tag("Scott")
                Text("Meng").tag("Meng")
            }
            .padding(.horizontal)
            .frame(height: 180)
        }
            .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
    }
}

struct Picker_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Picker_Intro()
    }
}
