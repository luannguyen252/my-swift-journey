//
//  Sequence.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Sequence: View {
    // MARK: - PROPERTIES
    enum SequenceState {
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
    
    @GestureState var sequenceState = SequenceState.inactive
    @State var tapCount = 0.0
    @State var viewDragState = CGSize.zero
    
    var translationOffset: CGSize {
        return CGSize(width: viewDragState.width + sequenceState.translation.width, height: viewDragState.height + sequenceState.translation.height)
    }
    
    var rotationAngle: Angle {
        return Angle(degrees: 90 * tapCount)
    }
    
    // MARK: - BODY
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
        
        let sequence = SequenceGesture(longPressGesture, dragGesture)
            .updating($sequenceState) { value, state, transaction in
                switch value {
                case .first(_):
                    state = .pressing
                case .second(_ , let dragValueOptional):
                    if dragValueOptional != nil {
                        state = .dragging(translation: dragValueOptional!.translation)
                    } else {
                        state = .pressing
                    }
                }
            }.onEnded { value in
                switch value {
                case .first(_):
                    self.tapCount += 1
                    // never executed
                case .second(_, let dragValueOptional):
                    if dragValueOptional != nil {
                        self.viewDragState.height += dragValueOptional!.translation.height
                        self.viewDragState.width += dragValueOptional!.translation.width
                    }
                }
            }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .rotationEffect(rotationAngle)
            .offset(translationOffset)
            .scaleEffect(sequenceState.scale)
            .gesture(sequence)
    }
}

// MARK: - PREVIEW
struct Sequence_Previews: PreviewProvider {
    static var previews: some View {
        Sequence()
    }
}
