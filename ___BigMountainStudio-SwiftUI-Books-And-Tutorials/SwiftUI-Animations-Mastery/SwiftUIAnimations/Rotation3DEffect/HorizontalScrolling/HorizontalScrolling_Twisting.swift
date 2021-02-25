//
//  HorizontalScrolling_Twisting.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HorizontalScrolling_Twisting: View {
    var data: [Color] = [.clear, .green, .blue, .red, .purple, .pink, .orange, .yellow]
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Horizontal Scrolling")
            SubtitleText("Introduction")
            BannerText("You can use a rotation effect to turn views while scrolling horizontally.")
            
            GeometryReader { screengp in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -40) {
                        ForEach(self.data, id: \.self) { datum in
                            GeometryReader { cardgp in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(datum)
                                    .overlay(
                                        VStack {
                                            Text("Center:\(Int(cardgp.frame(in: .global).midX))")
                                            Text("Offcenter: \(Int(abs(cardgp.frame(in: .global).midX - (screengp.size.width/2))))")
                                            Text("Center: \(Int(screengp.size.width/2))")
                                            Text("Rotation: \(Double((cardgp.frame(in: .global).midX - (screengp.size.width/2)) / screengp.size.width * 20))")
                                    })
                                    .rotation3DEffect(Angle(degrees: Double((cardgp.frame(in: .global).midX - (screengp.size.width/2)) / screengp.size.width * 20)),
                                                      axis: (x: 0, y: 0, z: 1), anchor: UnitPoint(x: 0.5, y: 3))
                            }.frame(width: 200, height: 200)
                        }
                    }.frame(height: 300)
                }
            }
            
        }.font(.body)
    }
}

struct HorizontalScrolling_Twisting_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrolling_Twisting()
    }
}
