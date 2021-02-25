//
//  AnimatedWaveBackground.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 09/12/2020.
//

import SwiftUI

struct AnimatedWaveBackground: View {
    var body: some View {
      GeometryReader { geometry in
        ZStack {
          AnimatedWave(width: geometry.size.width,
                       heightStartingPoint: geometry.size.height / 2 + 150, heightEndingPoint: geometry.size.height)
            .foregroundColor(Color.main.opacity(0.3))
          
          AnimatedWave(width: geometry.size.width * 1.2,
                       heightStartingPoint: geometry.size.height / 2 + 150, heightEndingPoint: geometry.size.height,
                       waveAmplitude: 150,
                       animationDuration: 12)
            .foregroundColor(Color.main.opacity(0.4))
          
          AnimatedWave(width: geometry.size.width * 2,
                       heightStartingPoint: geometry.size.height / 2 + 150, heightEndingPoint: geometry.size.height,
                       waveAmplitude: 200,
                       animationDuration: 10)
            .foregroundColor(Color.wave.opacity(0.4))
        }
      }
      .ignoresSafeArea(.all)
    }
}

struct AnimatedWaveBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedWaveBackground()
    }
}
