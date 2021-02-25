//
//  ClipShape_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ClipShape_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("ClipShape").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Only show the part of the view that the shape covers.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.blue)
                .foregroundColor(.white)
            
            Text("Original")
            Image("profile")
            
            Text("Clipped")
            HStack(spacing: 60) {
                Image("profile")
                    .clipShape(Circle())
                Image("profile")
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }.padding(.bottom, 40)
            
            Button(action: {}) {
                Text("Explore")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
            }
            .frame(width: 200, height: 75)
            .background(Image("yosemite")
            .clipShape(Capsule()))
        }
    }
}

struct ClipShape_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_Intro()
    }
}
