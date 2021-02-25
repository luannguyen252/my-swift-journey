//
//  Button_WithBorders.swift
//  100Views
//
//  Created by Mark Moeykens on 9/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Button_WithBorders: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Button").font(.largeTitle)
            Text("With Borders").font(.title).foregroundColor(.gray)
            Text("Applying borders can add a nice effect to your buttons. Here are some options.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white).font(.title)
            
            Button(action: {}) {
                Text("Square Border Button")
                    .padding()
                    .border(Color.purple)
            }
            Button(action: {}) {
                Text("Rounded Border Button")
                    .padding()
                    .border(Color.purple)
                    .cornerRadius(10)
            }
            
            Text("Look what happened when I tried to add a corner radius to the border. It is clipping the corners. Here is a different way you can accomplish this:")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white).font(.title)
            
            Button(action: {}) {
                Text("Border Button")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                )
            }
        }
        .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
    }
}

struct Button_WithBorders_Previews: PreviewProvider {
    static var previews: some View {
        Button_WithBorders()
    }
}
