//
//  ColorMultiply_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ColorMultiply_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color Multiply").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Color multiply doesn't really blend colors together. It puts a color filter over another view. So it doesn't create new colors, it creates a view with a color filter on top of it.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            HStack(spacing: 10) {
                Color.blue.frame(width: 100, height: 100)
                Image(systemName: "plus")
                Color.yellow.frame(width: 100, height: 100)
                Image(systemName: "equal")
                // Apply a yellow filter on top of the blue view
                Color.blue.colorMultiply(Color.yellow)
                    .frame(width: 100, height: 100)
            }
            
            HStack(spacing: 10) {
                Image("profile")
                Image(systemName: "plus")
                Color.pink.frame(width: 100, height: 100)
                Image(systemName: "equal")
                Image("profile")
                    // Apply a yellow filter on top of the image view
                    .colorMultiply(.pink)
            }
            
            HStack(spacing: 10) {
                Image("sunset")
                Image(systemName: "plus")
                Color.yellow.frame(width: 100, height: 100)
                Image(systemName: "equal")
                Image("sunset")
                    .colorMultiply(.yellow)
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ColorMultiply_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ColorMultiply_Intro()
    }
}
