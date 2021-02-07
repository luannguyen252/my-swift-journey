//
//  ContentView.swift
//  SwiftUI Transforms and Animations
//
//  Created by Ben Scheirman on 7/9/19.
//  Copyright © 2019 Fickle Bits. All rights reserved.
//

import SwiftUI

enum DragInfo {
    case inactive
    case active(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .active(let t):
            return t
        }
    }
    
    var isActive: Bool {
        switch self {
        case .inactive: return false
        case .active: return true
        }
    }
}

struct ContentView : View {
    
    @GestureState var dragInfo = DragInfo.inactive
    
    var body: some View {
        let gesture = DragGesture()
            .updating($dragInfo) { (value, dragInfo, _) in
                dragInfo = .active(translation: value.translation)
            }
        
        return ZStack {
            CardView(title: "Walmart", color: .blue)
                .offset(x: 0, y: dragInfo.isActive ? -400 : -40)
                .rotation3DEffect(Angle(degrees: dragInfo.isActive ? 20 : 4), axis: (x: 0, y: 0.25, z: 1))
                .scaleEffect(dragInfo.isActive ? 1 : 0.90)
            CardView(title: "Target", color: .red)
                .offset(x: 0, y: dragInfo.isActive ? -200 : -20)
                .rotation3DEffect(Angle(degrees: dragInfo.isActive ? 10 : 2), axis: (x: 0, y: 0.25, z: 1))
                .scaleEffect(dragInfo.isActive ? 1 : 0.95)
            CardView(title: " Card", color: .black)
                .offset(dragInfo.translation)
                .rotationEffect(Angle(degrees: Double(dragInfo.translation.width / 10)))
                .rotation3DEffect(Angle(degrees: Double(dragInfo.translation.height / 50)), axis: (x: 1, y: 0, z: 0))
                .gesture(gesture)
        }
        .offset(x: 0, y: 80)
        // .animation(.spring(mass: 1.0, stiffness: 100, damping: 20, initialVelocity: 0))
        .animation(.spring())
    }
}

struct CardView : View {
    
    let title: String
    let color: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 320, height: 210)
            
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }.shadow(radius: 6)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
