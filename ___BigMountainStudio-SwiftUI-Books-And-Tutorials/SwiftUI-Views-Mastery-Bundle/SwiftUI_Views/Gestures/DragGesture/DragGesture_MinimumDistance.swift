//
//  DragGesture_MinimumDistance.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DragGesture_MinimumDistance: View {
    @GestureState private var circleOffset = CGSize.zero // Reset back to original position
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Drag - Minimum Distance").foregroundColor(.gray)
            Text("You can set a minimum distance the user has to drag a view before it actually starts moving.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            Text("Drag the image out of the circle")
                .padding(.bottom)
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 1)
                    .frame(width: 100, height: 100)
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(Color.blue)
                    .offset(circleOffset)
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .updating($circleOffset, body: { (value, circleOffset, transaction) in
                                circleOffset = value.translation
                            }))
            }
        }.font(.title)
    }
}

struct DragGesture_MinimumDistance_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_MinimumDistance()
    }
}
