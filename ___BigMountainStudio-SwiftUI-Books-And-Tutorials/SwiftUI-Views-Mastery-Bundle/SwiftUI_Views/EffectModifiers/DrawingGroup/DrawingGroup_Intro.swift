//
//  DrawingGroup_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DrawingGroup_Intro: View {
    @State private var scaling = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Drawing Group").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Use drawingGroup to improve performance when working with many layers in a ZStack.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .foregroundColor(.white)
            
            Button("Change Scale") { self.scaling = true }
            GeometryReader { gr in
                ZStack {
                    ForEach(0...200, id: \.self) { _ in
                        Circle()
                            .foregroundColor(.orange)
                            .opacity(0.2)
                            .animation(Animation.interpolatingSpring(
                                        stiffness: 0.5, damping: 0.5)
                                        .repeatForever()
                                        .speed(.random(in: 0.05...0.9))
                                        .delay(.random(in: 0...2))
                            )
                            .scaleEffect(self.scaling ? .random(in: 0.1...2) : 1)
                            .frame(width: .random(in: 10...100),
                                   height: .random(in: 10...100))
                            .position(x: randomCoordinate(max: gr.size.width),
                                      y: randomCoordinate(max: gr.size.height))
                    }
                }
                .drawingGroup()
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
}

func randomDimension() -> CGFloat {
    return CGFloat.random(in: 40...100)
}

struct DrawingGroup_Intro_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroup_Intro()
    }
}
