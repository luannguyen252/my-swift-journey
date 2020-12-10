//
//  Exclusive.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Exclusive: View {
    // MARK: - PROPERTIES
    enum ExclusiveState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var scale: CGFloat {
            switch self {
            case .pressing:
                return 1.05
            default:
                return 1.0
            }
        }
        
        var translation: CGSize {
            switch self {
            case .dragging(let translation):
                return translation
            default:
                return CGSize.zero
            }
        }
    }
    
    @GestureState var exclusiveState = ExclusiveState.inactive
    @State var tapCount = 0.0
    @State var viewDragState = CGSize.zero
    
    var translationOffset: CGSize {
        return CGSize(width: viewDragState.width + exclusiveState.translation.width, height: viewDragState.height + exclusiveState.translation.height)
    }
    
    var rotationAngle: Angle {
        return Angle(degrees: 90 * tapCount)
    }
    
    var body: some View {
        
        let longPressGesture = LongPressGesture(minimumDuration: 0.5, maximumDistance: 100)
//            .updating($longPressState) { value, state, transaction in
//                state = .pressing
//            }.onEnded { value in
//                withAnimation {
//                    self.tapCount += 1
//                }
//            }
        
        let dragGesture = DragGesture(minimumDistance: 10)
//            .updating($dragState) { value, state, transaction in
//                state = .dragging(translation: value.translation)
//            }.onEnded { value in
//                self.viewDragState.height += value.translation.height
//                self.viewDragState.width += value.translation.width
//            }
        
        let exclusive = ExclusiveGesture(longPressGesture, dragGesture)
            .updating($exclusiveState) { value, state, transation in
                switch value {
                case .first(_):
                    state = .pressing
                case .second(let dragValue):
                    state = .dragging(translation: dragValue.translation)
                }
            }.onEnded { value in
                switch value {
                case .first(_):
                    withAnimation {
                        self.tapCount += 1
                    }
                case .second(let dragValue):
                    self.viewDragState.height += dragValue.translation.height
                    self.viewDragState.width += dragValue.translation.width
                }
            }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .rotationEffect(rotationAngle)
            .offset(translationOffset)
            .scaleEffect(exclusiveState.scale)
            .gesture(exclusive)
    }
}

// MARK: - PREVIEW
struct Exclusive_Previews: PreviewProvider {
    static var previews: some View {
        Exclusive()
    }
}
