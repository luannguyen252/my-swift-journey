//
//  Rotation.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Rotation: View {
    // MARK: - PROPERTIES
    enum RotationState {
        case inactive
        case rotating(angle: Angle)
        
        var rotationAngle: Angle {
            switch self {
            case .rotating(let angle):
                return angle
            default:
                return Angle.zero
            }
        }
    }
    
    @GestureState var rotationState = RotationState.inactive
    @State var viewRotationState = Angle.zero
    
    var rotationAngle: Angle {
        return viewRotationState + rotationState.rotationAngle
    }
    
    // MARK: - BODY
    var body: some View {
        let rotationGesture = RotationGesture(minimumAngleDelta: Angle(degrees: 5))
            .updating($rotationState) { value, state, transation in
                state = .rotating(angle: value)
        }.onEnded { value in
            self.viewRotationState += value
        }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .rotationEffect(rotationAngle)
            .gesture(rotationGesture)
    }
}

// MARK: - PREVIEW
struct Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Rotation()
    }
}
