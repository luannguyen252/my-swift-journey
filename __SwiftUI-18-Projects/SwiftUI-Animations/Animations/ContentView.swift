//
//  ContentView.swift
//  Animations
//
//  Created by Sandesh on 24/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
    .clipped()
        
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading ))
    }
}

struct ContentView: View {
    
    @State private var animationAmout = 0.0
    @State private var enabled = false
    @State private var dragAmount: CGSize = .zero
    let letters = Array("Hello SwiftUI")
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap ME") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//        Button("Tap Me") {
////            self.animationAmout += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(Color.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmout)
//                .opacity(Double(2-animationAmout))
//                .animation(
//                    Animation.easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//            )
//
//        )
//            .onAppear {
//                self.animationAmout = 2
//        }

//        MARK:- BINDING ANIMATION
//        print(animationAmout)
//        return VStack {
//            Stepper("Scale Amount", value: $animationAmout.animation(
//                Animation.easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in:  1...10)
//            Spacer()
//
//            Button("Tap ME") {
//                self.animationAmout += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(Color.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmout)
//        }

//        MARK:-EXPLICITE ANIMATION
//        Button("Tap ME") {
//            withAnimation(.interpolatingSpring(stiffness: 1, damping: 10)) {
//                 self.animationAmout += 360
//            }
//
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(Color.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmout),
//                          axis: (x: 1, y: 0, z: 0))

//      MARK:- ANIMATION STACK
//        Button("Tap ME") {
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.blue : Color.red)
//        .animation(nil)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))

//        MARK:- GESTURE ANIMATION
//        LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing)
//            .frame(width: 300, height:  200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.spring()) {
//                            self.dragAmount = .zero
//                        }
//                }
//        )
//

//  MARK:- GESTURE ANIMATION
//HStack(spacing: 0) {
//           ForEach(0..<letters.count) { num in
//               Text(String(self.letters[num]))
//                   .padding(5)
//                   .font(.title)
//                   .background(self.enabled ? Color.blue : Color.red)
//                   .offset(self.dragAmount)
//                   .animation(Animation.default.delay(Double(num) / 20))
//           }
//       }
//       .gesture(
//           DragGesture()
//               .onChanged { self.dragAmount = $0.translation }
//               .onEnded { _ in
//                   self.dragAmount = .zero
//                   self.enabled.toggle()
//           }
//       )
