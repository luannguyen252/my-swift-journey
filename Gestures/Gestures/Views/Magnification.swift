//
//  Magnification.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Magnification: View {
    // MARK: - PROPERTIES
    enum MagnificationState {
        case inactive
        case zooming(scale: CGFloat)
        
        var scale: CGFloat {
            switch self {
            case .zooming(let scale):
                return scale
            default:
                return CGFloat(1.0)
            }
        }
    }
    
    @GestureState var magnificationState = MagnificationState.inactive
    @State var viewMagnificationState = CGFloat(1.0)
    
    var magnificationScale: CGFloat {
        return viewMagnificationState * magnificationState.scale
    }
    
    // MARK: - BODY
    var body: some View {
        let magnificationGesture = MagnificationGesture()
            .updating($magnificationState) { value, state, transaction in
                state = .zooming(scale: value)
            }.onEnded { value in
                self.viewMagnificationState *= value
            }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .scaleEffect(magnificationScale)
            .gesture(magnificationGesture)
    }
}

// MARK: - PREVIEW
struct Magnification_Previews: PreviewProvider {
    static var previews: some View {
        Magnification()
    }
}
