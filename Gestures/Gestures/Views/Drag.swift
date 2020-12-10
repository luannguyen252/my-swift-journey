//
//  Drag.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct Drag: View {
    // MARK: - PROPERTIES
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .dragging(let translation):
                return translation
            default:
                return CGSize.zero
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    @State var viewDragState = CGSize.zero
    
    var translationOffset: CGSize {
        return CGSize(width: viewDragState.width + dragState.translation.width, height: viewDragState.height + dragState.translation.height)
    }
    
    // MARK: - BODY
    var body: some View {
        let dragGesture = DragGesture(minimumDistance: 10)
            .updating($dragState) { value, state, transaction in
                state = .dragging(translation: value.translation)
        }.onEnded { value in
            self.viewDragState.height += value.translation.height
            self.viewDragState.width += value.translation.width
        }
        
        return LogoDrawing()
            .frame(width: 350, height: 650)
            .offset(translationOffset)
            .gesture(dragGesture)
    }
}

// MARK: - PREVIEW
struct Drag_Previews: PreviewProvider {
    static var previews: some View {
        Drag()
    }
}
