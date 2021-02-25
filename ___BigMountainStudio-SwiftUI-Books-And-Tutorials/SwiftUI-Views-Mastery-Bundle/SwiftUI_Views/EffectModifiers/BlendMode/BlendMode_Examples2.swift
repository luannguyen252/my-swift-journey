//
//  BlendMode_Examples2.swift
//  100Views
//
//  Created by Mark Moeykens on 8/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendMode_Examples2: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Blend Mode Examples 2")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Text("Blend Mode: destinationOver").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.destinationOver)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.destinationOver)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: difference").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.difference)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.difference)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: exclusion").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.exclusion)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.exclusion)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: hardLight").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.hardLight)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.hardLight)
                    }
                }.padding(.bottom, 40)
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct BlendMode_Examples2_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode_Examples2()
    }
}
