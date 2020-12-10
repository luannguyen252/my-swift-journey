//
//  Tap.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Tap: View {
    // MARK: - PROPERTIES
    @State var tapCount = 0.0
    
    var rotationAngle: Angle {
        return Angle(degrees: 90 * tapCount)
    }
    
    // MARK: - BODY
    var body: some View {
        let tapGesture = TapGesture(count: 2)
            .onEnded {
                withAnimation {
                    self.tapCount += 1
                }
        }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .rotationEffect(rotationAngle)
            .gesture(tapGesture)
    }
}

// MARK: - PREVIEW
struct Tap_Previews: PreviewProvider {
    static var previews: some View {
        Tap()
    }
}
