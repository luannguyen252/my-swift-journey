//
//  PagerView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct PagerView<Content: View>: View {
    // MARK: - PROPERTIES
    let pageCount: Int
    let viewContent: Content
    let itemWidth: CGFloat

    @Binding var currentIndex: Int
    
    @GestureState private var translation: CGFloat = 0.0
    
    // MARK: - DRAG GESTURE
    var gesture: some Gesture {
        DragGesture().updating($translation) { (value, state, _) in
            state = value.translation.width
        }.onEnded { value in
            let offset = value.translation.width / itemWidth
            let newIndex = (CGFloat(currentIndex) - offset).rounded()
            currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
        }
    }
    
    init(count: Int, index: Binding<Int>, viewWidth: CGFloat, @ViewBuilder content: () -> Content) {
        pageCount = count
        viewContent = content()
        itemWidth = viewWidth
        _currentIndex = index
    }
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 0) {
            viewContent.frame(width: itemWidth)
        } //: HSTACK
        .frame(width: itemWidth, alignment: .leading)
        .offset(x: -CGFloat(currentIndex) * itemWidth)
        .offset(x: translation)
        .animation(.interactiveSpring(response: 1.0, dampingFraction: 0.7, blendDuration: 0.1))
        .gesture(gesture)
    }
}
