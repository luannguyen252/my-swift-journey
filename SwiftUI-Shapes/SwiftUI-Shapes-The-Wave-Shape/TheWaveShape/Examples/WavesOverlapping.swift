//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct WavesOverlapping: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20.0) {
                ZStack(alignment: .top) {
                    Wave(yOffset: -0.5)
                        .fill(Color.themeTertiary)
                        .frame(height: 190.0)
                        .shadow(radius: 8)
                    Wave()
                        .fill(Color.themeTertiary)
                        .frame(height: 170.0)
                        .shadow(radius: 8)
                    
                    Wave(yOffset: 0.25)
                        .fill(Color.themeTertiary)
                        .frame(height: 120.0)
                        .shadow(radius: 8)
                        .overlay(Text("Overlapping Wave")
                            .font(.largeTitle)
                        .fontWeight(.bold))
                }
                
                Spacer()
                
                Text("How about some outlines?")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Shapes can have strokes applied to them:")
                
                ZStack {
                    Wave()
                        .stroke(Color.themeAccent, lineWidth: 10)
                        .frame(height: 120.0)
                        .padding()
                        .shadow(radius: 10, y: 5)
                    
                    Wave()
                        .stroke(Color.themeTertiary, style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [15, 20]))
                        .frame(height: 110.0)
                        .padding([.top, .leading], 20)
                        .shadow(radius: 10, y: 5)
                }
                .padding(.horizontal)
                
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.top)
            
        }
        .foregroundColor(.themeForeground)
    }
}

struct WavesOverlapping_Previews: PreviewProvider {
    static var previews: some View {
        WavesOverlapping()
    }
}
