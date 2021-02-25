//
//  BlendMode_Examples3.swift
//  100Views
//
//  Created by Mark Moeykens on 8/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendMode_Examples3: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Blend Mode Examples 3")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Text("Blend Mode: hue").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.hue)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.hue)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: lighten").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.lighten)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.lighten)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: luminosity").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.luminosity)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.luminosity)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: multiply").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.multiply)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.multiply)
                    }
                }.padding(.bottom, 40)
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct BlendMode_Examples3_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode_Examples3()
    }
}
