//
//  Path_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Path_Intro : View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Path").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("A Path by itself is not a view. You can modify a path to make it a view though.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            Text("You can't see this path because no modifier is added:")
                .padding(.horizontal)
            Path { path in
                // Set the starting Point:
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: 300, y: 10))
            }
            
            Text("Let's draw a path and modify it with a red stroke:")
                .padding(.horizontal)
            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: 200, y: 10))
            }
            .strokedPath(StrokeStyle(lineWidth: 5))
            .foregroundColor(.red)
            
            Text("Let's create our own divider:")
                .padding(.horizontal)
            MyDivider(lineWidth: 5, color: .purple)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct MyDivider: View {
    var lineWidth: CGFloat = 1
    var color: Color = Color.secondary
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: geometry.size.width - 10, y: 10))
            }
            .strokedPath(StrokeStyle(lineWidth: self.lineWidth, lineCap: CGLineCap.round))
            .foregroundColor(self.color)
        }
    }
}

struct Path_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Path_Intro()
    }
}
