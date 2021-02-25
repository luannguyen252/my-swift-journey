//
//  DragGesture_LimitToXOrY.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DragGesture_LimitToXOrY: View {
    @State private var currentSliderPositionX: CGFloat = 0.0
    @GestureState private var slideOffset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Limit to X Axis").foregroundColor(.gray)
            Text("You might want to limit the drag of your view so the user can only drag horizontally or vertically.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            Text("slideOffset: (\(Int(slideOffset.width)),\(Int(slideOffset.height)) )")
            Text("currentSliderPositionX: (\(Int(currentSliderPositionX)))")
            
            GeometryReader { gr in
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .rotationEffect(.degrees(90))
                }
                .foregroundColor(.white)
                .frame(height: 100)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                // Limit to just X axis
                .offset(x: self.currentSliderPositionX + self.slideOffset.width)
                .gesture(DragGesture()
                    .updating(self.$slideOffset, body: { (value, slideOffset, transaction) in
                        slideOffset = value.translation
                    })
                    .onEnded({ value in
                        if value.translation.width < -gr.size.width * 0.6 {
                            self.currentSliderPositionX = 50 - gr.size.width
                        } else {
                            self.currentSliderPositionX = 0
                        }
                    }))
                .animation(.default) // Note: Animation is discussed in detail in the SwiftUI Animations book.
            }
        }.font(.title)
    }
}

struct DragGesture_LimitToXOrY_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_LimitToXOrY()
    }
}
