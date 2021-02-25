//
//  AnimatedWave.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 09/12/2020.
//

import SwiftUI

struct AnimatedWave: View {
  let width: CGFloat
  let heightStartingPoint: CGFloat
  let heightEndingPoint: CGFloat
  var waveAmplitude: CGFloat = 100
  var animationDuration: Double = 8
  
  @State private var animated = false
  
    var body: some View {
      Path { path in
        path.move(to: CGPoint(x: 0, y: heightStartingPoint))
        path.addCurve(to: CGPoint(x: width, y: heightStartingPoint),
                      control1: CGPoint(x: width * 0.35, y: heightStartingPoint  + waveAmplitude),
                      control2: CGPoint(x: width * 0.65, y: heightStartingPoint  - waveAmplitude))
        
        path.addCurve(to: CGPoint(x: 2*width, y: heightStartingPoint),
                      control1: CGPoint(x: width * 1.35, y: heightStartingPoint  + waveAmplitude),
                      control2: CGPoint(x: width * 1.65, y: heightStartingPoint  - waveAmplitude))
        
        path.addLine(to: CGPoint(x: 2*width, y: heightEndingPoint))
        
        path.addLine(to: CGPoint(x: 0, y: heightEndingPoint))
      }
      .offset(x: animated ? -width : 0)
      .animation(Animation
                  .linear(duration: animationDuration)
                  .repeatForever(autoreverses: false))
      .onAppear {
        DispatchQueue.main.async {
          animated = true
        }
      }
    }
}

struct AnimatedWave_Previews: PreviewProvider {
    static var previews: some View {
      AnimatedWave(width: UIScreen.main.bounds.width,
                   heightStartingPoint: UIScreen.main.bounds.height / 2, heightEndingPoint: UIScreen.main.bounds.height)
        .foregroundColor(Color.blue.opacity(0.3))
    }
}
