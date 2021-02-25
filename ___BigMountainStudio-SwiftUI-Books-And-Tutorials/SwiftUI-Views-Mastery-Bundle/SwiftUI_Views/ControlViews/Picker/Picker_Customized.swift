//
//  Picker_2_00_Modifiers.swift
//  100Views
//
//  Created by Mark Moeykens on 6/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Picker_Customized : View {
    @State private var favoriteState = 1
    @State private var youTuberName = "Mark"
    var body: some View {
        VStack(spacing: 20) {
            Text("Picker").font(.largeTitle)
            Text("With Modifiers").foregroundColor(.gray)
            Text("Your Favorite State:")
            Picker(selection: $favoriteState, label: Text("")) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
            }
            .padding(.horizontal)
            .background(Color("AccentColorDark"))
            .cornerRadius(15)
            .shadow(radius: 5)
            Text("Who do you want to watch today?")
            Picker(selection: $youTuberName, label: Text("")) {
                Text("Paul").tag("Paul")
                Text("Chris").tag("Chris")
                Text("Mark").tag("Mark")
                Text("Scott").tag("Scott")
                Text("Meng").tag("Meng")
            }
            .padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.blue, lineWidth: 1))
        }
        .labelsHidden() // Show no labels on pickers
        .font(.title)
        .minimumScaleFactor(0.8)
    }
}

struct Picker_Customized_Previews : PreviewProvider {
    static var previews: some View {
        Picker_Customized()
            .preferredColorScheme(.dark)
    }
}
