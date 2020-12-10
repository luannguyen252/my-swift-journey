//
//  LongPress.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct LongPress: View {
    // MARK: - PROPERTIES
    enum LongPressState {
        case inactive
        case pressing
        
        var scale: CGFloat {
            switch self {
            case .pressing:
                return 1.05
            default:
                return 1.0
            }
        }
    }
    
    @GestureState var longPressState = LongPressState.inactive
    @State var tapCount = 0.0
    
    var rotationAngle: Angle {
        return Angle(degrees: 90 * tapCount)
    }
    
    // MARK: - BODY
    var body: some View {
        let longPressGesture = LongPressGesture(minimumDuration: 0.5, maximumDistance: 100)
            .updating($longPressState) { value, state, transaction in
                state = .pressing
        }.onEnded { value in
            withAnimation {
                self.tapCount += 1
            }
        }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .rotationEffect(rotationAngle)
            .scaleEffect(longPressState.scale)
            .gesture(longPressGesture)
    }
}

// MARK: - PREVIEW
struct LongPress_Previews: PreviewProvider {
    static var previews: some View {
        LongPress()
    }
}
