//
//  BlendMode_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendMode_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Blend Mode").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Control how layers are blended into each other with the blendMode modifier. You apply blendMode to the TOP layer.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .foregroundColor(.white)
            Text("Blend Mode: None").font(.title)
            HStack (spacing: 60) {
                ZStack {
                    BlueRectangle()
                    YellowRectangle().offset(x: 20, y: 20)
                }
                ZStack {
                    Image("sunset")
                    YellowRectangle().offset(x: 20, y: 20)
                }
            }.padding(.bottom, 40)
            
            Text("Blend Mode: colorBurn").font(.title)
            HStack (spacing: 60) {
                ZStack {
                    BlueRectangle()
                    YellowRectangle().offset(x: 20, y: 20)
                        .blendMode(.colorBurn)
                }
                ZStack {
                    Image("sunset")
                    YellowRectangle().offset(x: 20, y: 20)
                        .blendMode(.colorBurn)
                }
            }
            .padding(.bottom, 40)
        }
        .minimumScaleFactor(0.5)
    }
}

struct BlendMode_Intro_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode_Intro()
    }
}
