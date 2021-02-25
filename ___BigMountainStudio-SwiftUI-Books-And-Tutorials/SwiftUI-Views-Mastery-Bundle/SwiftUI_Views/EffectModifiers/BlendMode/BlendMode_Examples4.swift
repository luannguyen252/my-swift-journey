//
//  BlendMode_Examples4.swift
//  100Views
//
//  Created by Mark Moeykens on 8/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendMode_Examples4: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Blend Mode Examples 4")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Text("Blend Mode: normal").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.normal)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.normal)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: overlay").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.overlay)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.overlay)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: plusDarker").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.plusDarker)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.plusDarker)
                    }
                }.padding(.bottom, 40)
                
                Text("Blend Mode: plusLighter").font(.title)
                HStack (spacing: 60) {
                    ZStack {
                        BlueRectangle()
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.plusLighter)
                    }
                    ZStack {
                        Image("sunset")
                        YellowRectangle().offset(x: 20, y: 20)
                            .blendMode(.plusLighter)
                    }
                }.padding(.bottom, 40)
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct BlendMode_Examples4_Previews: PreviewProvider {
    static var previews: some View {
        BlendMode_Examples4()
    }
}
