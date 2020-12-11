//
//  DragView.swift
//  Courses
//
//  Created by Luan Nguyen on 11/12/2020.
//

import SwiftUI

struct DragView<Content: View>: View {
    // MARK: - PROPERTIES
    @GestureState private var dragState = DragState.inactive
    @State var position = CardPosition.bottom
    
    let gradient = Gradient(colors: [Color("blue-dark"), Color("blue")])
    
    var content: () -> Content
    
    // MARK: - BODY
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return self.content()
            .frame(height: UIScreen.main.bounds.height)
            .background(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10)
            .offset(y: self.position.rawValue + self.dragState.translation.height)
            .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300, damping: 30, initialVelocity: 10))
            .gesture(drag)
    }
    
    // MARK: - DRAG
    private func onDragEnded(drag: DragGesture.Value){
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = self.position.rawValue + drag.translation.height
        let positionAbove: CardPosition = .top
        let positionBelow: CardPosition = .bottom
        let closestPosition: CardPosition
        
        if(cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBelow
        }
        
        if verticalDirection > 0 {
            self.position = positionBelow
        } else if verticalDirection < 0 {
            self.position = positionAbove
        } else{
            self.position = closestPosition
        }
    }
}

// MARK: - CARD POSITION
enum CardPosition:CGFloat {
    case top = 50
    case bottom = 700
}

// MARK: - DRAG STATE
enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation:CGSize{
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
