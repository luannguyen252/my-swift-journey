//
//  Frame_Controls_Shapes.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Frame_Controls_Shapes: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Frame")
                .font(.largeTitle)
            
            Text("Controls & Shapes")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can observe two behaviors when it comes to sizes of views. Some views push out to fill all available space. Some views pull in to be as small as possible to fit their content. You can use frames to change these behaviors.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .minimumScaleFactor(0.5)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Text("Shapes push out. Use frames to pull them in:")
            HStack {
                Capsule().foregroundColor(.pink)
                    .frame(width: 150, height: 100)
                Rectangle().foregroundColor(.pink)
                    .frame(width: 150, height: 75)
            }
            
            Text("Buttons pull in. Use frames to push them out:")
            Button(action: {}) {
                Text("Button")
            }
            .frame(width: 200, height: 100)
            .border(Color.pink)
        }
    }
}

struct Frame_Controls_Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Frame_Controls_Shapes()
    }
}
