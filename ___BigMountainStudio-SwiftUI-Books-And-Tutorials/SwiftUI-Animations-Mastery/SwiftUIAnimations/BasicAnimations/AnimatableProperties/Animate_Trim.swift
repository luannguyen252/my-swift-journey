//
//  Animate_Trim.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_Trim: View {
    @State private var change = false
    @State private var circleProgress: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Trim")
            BannerText("Animating the trim of a circle is a great way to show progress.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
                self.circleProgress = self.change ? 0.25 : 1
            }
            
            Spacer()
            
            Circle()
                .trim(from: 0, to: circleProgress) // Animate trim
                .stroke(Color.blue,
                        style: StrokeStyle(lineWidth: 40,
                                           lineCap: CGLineCap.round))
                .frame(height: 300)
                .rotationEffect(.degrees(-90)) // Start from top
                .padding(40)
                .animation(.default)
            
            Spacer()
            
        }.font(.title)
    }
}

struct Animate_Trim_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Trim()
    }
}
