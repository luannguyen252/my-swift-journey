//
//  SequenceGesture_AppleExample.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SequenceGesture_AppleExample: View {
    // An enum is used to manage and combine the states of both gestures.
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    
    var body: some View {
        // Long press has to happen before the drag can happen.
        let longPressDrag = LongPressGesture(minimumDuration: 1)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                case .first(true):
                    state = .pressing // Changes dragState.isActive to true (adds shadow and overlay to circle)
                case .second(true, let dragValue):
                    // Get the gesture values from the value enum
                    state = .dragging(translation: dragValue?.translation ?? .zero)
                default:
                    state = .inactive
                }
        }
        .onEnded { value in
            // Set the final position of the circle
            guard case .second(_, let drag?) = value else { return }
            self.viewState.width += drag.translation.width
            self.viewState.height += drag.translation.height
        }
        
        return VStack(spacing: 20) {
                Text("Gestures").font(.largeTitle)
                Text("Sequence Gestures").foregroundColor(.gray)
                Text("Here is an example of a sequence gesture inspired by Apple documentation.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                Text("Long Press THEN Drag")
            
                Circle()
                    .fill(Color.blue)
                    .overlay(dragState.isDragging ? Circle().stroke(Color.green, lineWidth: 4) : nil)
                    .frame(width: 100, height: 100, alignment: .center)
                    .offset(
                        x: viewState.width + dragState.translation.width,
                        y: viewState.height + dragState.translation.height
                )
                    .animation(.none)
                    .shadow(radius: dragState.isActive ? 8 : 0)
                    .gesture(longPressDrag) // Add the sequenced gestures
            }.font(.title)
    }
}


struct SequenceGesture_AppleExample_Previews: PreviewProvider {
    static var previews: some View {
        SequenceGesture_AppleExample()
    }
}
