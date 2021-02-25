//
//  Curve_EaseIn.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curves_Examples: View {
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Curves")
            SubtitleText("Examples")
            BannerText("There are 4 preset animation curves available to you.")
            
            Group {
                Text("easeInOut & default: Slow, faster, slow")
                // Use geometry reader to get the size of the device.
                // Move the circle the width of the device - 40 points.
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeInOut(duration: 2))
                }
                
                Text("easeIn: Start slow")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeIn(duration: 2))
                }
                
                Text("easeOut: Slows at end")
                GeometryReader { gp in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2))
                }
                
                Text("linear: Same speed")
                GeometryReader { gp  in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gp.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2))
                }
            }
            
            Button("Move") {
                self.move.toggle()
            }
        }
        .font(.title)
        .padding(.bottom, 40)
    }
}

struct Curves_Examples_Previews: PreviewProvider {
    static var previews: some View {
        Curves_Examples()
    }
}
