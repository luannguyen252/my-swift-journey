//
//  Position_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Position_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Position")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("When you use the position modifier, it'll turn your pull-in view into a push-out view. Take a look.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Text("No Position Modifier")
                .border(Color.purple)
            
            Text("With Position Modifier")
                .position(x: 200, y: 70) // Adding position will push out this view
                .border(Color.purple, width: 5)
            
            Text("The bounds of the view push out to fill all available space.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .font(.title)
    }
}

struct Position_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Position_Intro()
    }
}
