//
//  BlendMode_Examples5.swift
//  100Views
//
//  Created by Mark Moeykens on 8/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendMode_Examples5: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Blend Mode Examples 5")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Text("Blend Mode: saturation").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.saturation)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.saturation)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: screen").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.screen)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.screen)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: softLight").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.softLight)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.softLight)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: sourceAtop").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.sourceAtop)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.sourceAtop)
                    }
                }.padding(.bottom, 40)
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct BlendMode_Examples5_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode_Examples5()
    }
}
