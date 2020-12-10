//
//  Simultaneous.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Simultaneous: View {
    // MARK: - PROPERTIES
    enum SimultaneousState {
        case inactive
        case rotating(angle: Angle)
        case zooming(scale: CGFloat)
        case both(angle: Angle, scale: CGFloat)
        
        var rotationAngle: Angle {
            switch self {
            case .rotating(let angle), .both(let angle, _):
                return angle
            default:
                return Angle.zero
            }
        }
        
        var scale: CGFloat {
            switch self {
            case .zooming(let scale), .both(_, let scale):
                return scale
            default:
                return CGFloat(1.0)
            }
        }
    }
    
    @GestureState var simultaneousState = SimultaneousState.inactive
    @State var viewRotationState = Angle.zero
    @State var viewMagnificationState = CGFloat(1.0)
    
    var magnificationScale: CGFloat {
        return viewMagnificationState * simultaneousState.scale
    }
    
    var rotationAngle: Angle {
        return viewRotationState + simultaneousState.rotationAngle
    }
    
    // MARK: - BODY
    var body: some View {
        
        let rotationGesture = RotationGesture(minimumAngleDelta: Angle(degrees: 5))
//            .updating($rotationState) { value, state, transation in
//                state = .rotating(angle: value)
//            }.onEnded { value in
//                self.viewRotationState += value
//            }
        
        let magnificationGesture = MagnificationGesture()
//            .updating($magnificationState) { value, state, transaction in
//                state = .zooming(scale: value)
//            }.onEnded { value in
//                self.viewMagnificationState *= value
//            }
        
        let simultaneous = SimultaneousGesture(rotationGesture, magnificationGesture)
            .updating($simultaneousState) { value, state, transation in
                if value.first != nil && value.second != nil {
                    state = .both(angle: value.first!, scale: value.second!)
                } else if value.first != nil {
                    state = .rotating(angle: value.first!)
                } else if value.second != nil {
                    state = .zooming(scale: value.second!)
                } else {
                    state = .inactive
                }
            }.onEnded { value in
                self.viewRotationState += value.first ?? Angle.zero
                self.viewMagnificationState *= value.second ?? 1
            }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .scaleEffect(magnificationScale)
            .rotationEffect(rotationAngle)
            .gesture(simultaneous)
    }
}

// MARK: - PREVIEW
struct Simultaneous_Previews: PreviewProvider {
    static var previews: some View {
        Simultaneous()
    }
}
