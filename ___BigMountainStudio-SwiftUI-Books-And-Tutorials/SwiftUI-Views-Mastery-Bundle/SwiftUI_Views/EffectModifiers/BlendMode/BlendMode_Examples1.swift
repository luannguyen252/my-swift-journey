//
//  BlendMode_Examples1.swift
//  100Views
//
//  Created by Mark Moeykens on 8/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendMode_Examples1: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Blend Mode Examples 1")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                Text("Blend Mode: color").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.color)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.color)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: colorDodge").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.colorDodge)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.colorDodge)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: darken").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.darken)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.darken)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: destinationOut").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.destinationOut)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.destinationOut)
                    }
                }.padding(.bottom, 40)
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct BlendMode_Examples1_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode_Examples1()
    }
}
