//
//  Brightness_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Brightness_Intro: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Brightness").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("You can use the Brightness modifier to change colors, images or views so they are brighter. Valid values are from 0 (no effect) to 1 (full effect).")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            HStack {
                Color.black
                    .frame(width: 50, height: 50)
                    .brightness(0)
                    .overlay(Text("0%").foregroundColor(.white))
                Color.black
                    .frame(width: 50, height: 50)
                    .brightness(0.2)
                    .overlay(Text("20%").foregroundColor(.white))
                Color.black
                    .frame(width: 50, height: 50)
                    .brightness(0.4)
                    .overlay(Text("40%").foregroundColor(.white))
                Color.black
                    .frame(width: 50, height: 50)
                    .brightness(0.6)
                    .overlay(Text("60%"))
                Color.black
                    .frame(width: 50, height: 50)
                    .brightness(0.8)
                    .overlay(Text("80%"))
                Color.black
                    .frame(width: 50, height: 50)
                    .brightness(1)
                    .overlay(Text("100%"))
            }
            HStack {
                Color.red
                    .frame(width: 50, height: 50)
                    .brightness(0)
                    .overlay(Text("0%"))
                Color.red
                    .frame(width: 50, height: 50)
                    .brightness(0.2)
                    .overlay(Text("20%"))
                Color.red
                    .frame(width: 50, height: 50)
                    .brightness(0.4)
                    .overlay(Text("40%"))
                Color.red
                    .frame(width: 50, height: 50)
                    .brightness(0.6)
                    .overlay(Text("60%"))
                Color.red
                    .frame(width: 50, height: 50)
                    .brightness(0.8)
                    .overlay(Text("80%"))
                Color.red
                    .frame(width: 50, height: 50)
                    .brightness(1)
                    .overlay(Text("100%"))
            }
            HStack {
                Color.purple
                    .frame(width: 50, height: 50)
                    .brightness(0)
                    .overlay(Text("0%"))
                Color.purple
                    .frame(width: 50, height: 50)
                    .brightness(0.2)
                    .overlay(Text("20%"))
                Color.purple
                    .frame(width: 50, height: 50)
                    .brightness(0.4)
                    .overlay(Text("40%"))
                Color.purple
                    .frame(width: 50, height: 50)
                    .brightness(0.6)
                    .overlay(Text("60%"))
                Color.purple
                    .frame(width: 50, height: 50)
                    .brightness(0.8)
                    .overlay(Text("80%"))
                Color.purple
                    .frame(width: 50, height: 50)
                    .brightness(1)
                    .overlay(Text("100%"))
            }
            HStack {
                Color.blue
                    .frame(width: 50, height: 50)
                    .brightness(0)
                    .overlay(Text("0%"))
                Color.blue
                    .frame(width: 50, height: 50)
                    .brightness(0.2)
                    .overlay(Text("20%"))
                Color.blue
                    .frame(width: 50, height: 50)
                    .brightness(0.4)
                    .overlay(Text("40%"))
                Color.blue
                    .frame(width: 50, height: 50)
                    .brightness(0.6)
                    .overlay(Text("60%"))
                Color.blue
                    .frame(width: 50, height: 50)
                    .brightness(0.8)
                    .overlay(Text("80%"))
                Color.blue
                    .frame(width: 50, height: 50)
                    .brightness(1)
                    .overlay(Text("100%"))
            }
            HStack {
                Color.orange
                    .frame(width: 50, height: 50)
                    .brightness(0)
                    .overlay(Text("0%"))
                Color.orange
                    .frame(width: 50, height: 50)
                    .brightness(0.2)
                    .overlay(Text("20%"))
                Color.orange
                    .frame(width: 50, height: 50)
                    .brightness(0.4)
                    .overlay(Text("40%"))
                Color.orange
                    .frame(width: 50, height: 50)
                    .brightness(0.6)
                    .overlay(Text("60%"))
                Color.orange
                    .frame(width: 50, height: 50)
                    .brightness(0.8)
                    .overlay(Text("80%"))
                Color.orange
                    .frame(width: 50, height: 50)
                    .brightness(1)
                    .overlay(Text("100%"))
            }
            HStack {
                Image("sunset")
                    .brightness(0.25)
                    .overlay(Text("25%"))
                Image("sunset")
                    .brightness(0.5)
                    .overlay(Text("50%"))
                Image("sunset")
                    .brightness(0.75)
                    .overlay(Text("75%"))
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct Brightness_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Brightness_Intro()
    }
}
