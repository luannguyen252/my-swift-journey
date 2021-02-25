//
//  RegularButton.swift
//  100Views
//
//  Created by Mark Moeykens on 6/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct RegularButton : View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Button")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("If you just want to show the default text style in a button then you can pass in a string as the first parameter.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(2)
            
            Button("Default Button Style") {
                // Your code here
            }
            Text("You can customize the text shown for a button.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple).layoutPriority(1)
                .foregroundColor(.white)
            Button(action: {
                 // Your code here 
            }) {
                Text("Headline Font")
                    .font(.headline)
            }
            Divider()
            Button(action: {}) {
                Text("Foreground Color")
                    .foregroundColor(Color.red)
            }
            Divider()
            Button(action: {}) {
                Text("Thin Font Weight")
                    .fontWeight(.thin)
            }
        }.font(.title) // Make all fonts use the title style
    }
}

struct RegularButton_Previews : PreviewProvider {
    static var previews: some View {
        RegularButton()
    }
}
