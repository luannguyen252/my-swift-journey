//
//  HorizontalScrolling_YAxisswift.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HorizontalScrolling_YAxis1: View {
    var data: [Color] = [.green, .blue, .red, .purple, .pink, .orange, .yellow]
    
    /*
     ROTATION
     -20° ----------------------0----------------------20°
     
     1. Start with the rotation angle you want on the leading and the trailing sides
     a. Leading = -20°
     b. Trailing = 20°
     2. Take width of screen (say, 100) and divide by 2. We'll call this the "Middle" (50).
     3. Take Middle (50) and divide that by the positive angle (50/20). This gives you the number you want to divide by (2.5)
     4.
     
     // Card center - screen center point
     // Get screen center point with either:
     a) screengp.frame(in: .local).midX
     b) screengp.size.width/2
     
     xFromCenter = (cardgp.frame(in: .global).midX - (screengp.size.width/2))
     (xFromCenter / screengp.size.width * 20) // 20 is my target angle in degrees
     So whole formula is:
     (cardgp.frame(in: .global).midX - (screengp.size.width/2)) / screengp.size.width * 20
     
     
     SCALING
     0.7 ------------------ 1.0 ---------------- 0.7
     
     Middle = 50
     
     */
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Horizontal Scrolling")
            SubtitleText("Introduction")
            BannerText("You can use a rotation effect to turn views while scrolling horizontally.")
            
            GeometryReader { screengp in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25) {
                        ForEach(self.data, id: \.self) { datum in
                            GeometryReader { cardgp in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(datum)
                                    .overlay(
                                        VStack {
                                            Text("Center:\(Int(cardgp.frame(in: .global).midX))")
                                            Text("Offcenter: \(Int(abs(cardgp.frame(in: .global).midX - (screengp.size.width/2))))")
                                            Text("Scale: \(((screengp.size.width/0.5)-abs(cardgp.frame(in: .global).midX - (screengp.size.width/2)))/(screengp.size.width/0.5))")
                                            Text("Screen Center: \(Int(screengp.size.width/2))")
                                            Text("Rotation: \(Double((cardgp.frame(in: .global).midX - (screengp.size.width/2)) / screengp.size.width * 20)))")
                                        }
                                )
                                    .rotation3DEffect(Angle(degrees: Double((cardgp.frame(in: .global).midX - (screengp.size.width/2)) / screengp.size.width * 20)),
                                                            axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(CGFloat(((screengp.size.width/0.5)-abs(cardgp.frame(in: .global).midX - screengp.size.width/2)) / (screengp.size.width/0.5)))
                            }.frame(width: 200, height: 200)
                        }
                    }.frame(height: 300)
                }
            }
            
        }//.font(.title)
    }
}


struct HorizontalScrolling_YAxis1_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrolling_YAxis1()
    }
}
