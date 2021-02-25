//
//  LuminanceToAlpha_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LuminanceToAlpha_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Luminance To Alpha").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Turn darker parts of your photo to transparent areas. The darker the color, the more transparent.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    Text("Original Photo")
                    Spacer()
                    Text("Inverted Photo")
                    Spacer()
                }
                
                HStack {
                    Image("yosemite")
                    Image("yosemite").luminanceToAlpha()
                }
                HStack {
                    Image("rainbow").resizable().frame(width: 200)
                    Image("rainbow").resizable().frame(width: 200).luminanceToAlpha()
                }
                HStack {
                    Image("valley").resizable().frame(width: 200)
                    Image("valley").resizable().frame(width: 200).luminanceToAlpha()
                }
                Text("Adding yellow background to show transparency.")
                HStack {
                    Image("sunset").resizable().frame(width: 200)
                    ZStack {
                        Color.yellow
                        Image("sunset").resizable().frame(width: 200).luminanceToAlpha()
                    }
                }
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct LuminanceToAlpha_Intro_Previews: PreviewProvider {
    static var previews: some View {
        LuminanceToAlpha_Intro()
    }
}
