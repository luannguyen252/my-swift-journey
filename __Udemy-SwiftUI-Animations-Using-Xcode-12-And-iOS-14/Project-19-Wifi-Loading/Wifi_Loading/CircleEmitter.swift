//
//  CircleEmitter.swift
//  Wifi_Loading
//
//  Created by Stephen DeStefano on 1/8/21.
//

import SwiftUI

struct CircleEmitter: View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        Circles()
            .fill(Color.white.opacity(0.75))
            .scaleEffect(isAnimating ? 2 : 0)
            .animation(isAnimating ? Animation.spring() : Animation.easeInOut(duration: 0))
    }
}

struct CircleEmitter_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CircleEmitter(isAnimating: .constant(true))
        }
            
    }
}
