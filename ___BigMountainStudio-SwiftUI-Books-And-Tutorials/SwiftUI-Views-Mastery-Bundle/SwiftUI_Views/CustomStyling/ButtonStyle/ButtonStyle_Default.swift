//
//  ButtonStyle_Default.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ButtonStyle_Default: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("ButtonStyle").font(.largeTitle)
                Text("Defaults").font(.title).foregroundColor(.gray)
                Text("There are some button styles that are already made.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                
                Group {
                    Text("DefaultButtonStyle").font(.title)
                    Button("DefaultButtonStyle", action: {})
                        .buttonStyle(DefaultButtonStyle())
                    
                    Text("PlainButtonStyle").font(.title)
                    Button("PlainButtonStyle", action: {})
                        .buttonStyle(PlainButtonStyle())
                    
                    Text("BorderlessButtonStyle").font(.title)
                    Button("BorderlessButtonStyle", action: {})
                        .buttonStyle(BorderlessButtonStyle())
                }
                Text("You don't need to apply the default button style. The plain button style is the only visually different one in iOS. ")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ButtonStyle_Default_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle_Default()
    }
}
