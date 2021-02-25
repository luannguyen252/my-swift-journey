//
//  Text_LineSpacing.swift
//  100Views
//
//  Created by Mark Moeykens on 6/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_LineSpacing : View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Text").font(.largeTitle)
            Text("Line Spacing").font(.title).foregroundColor(.gray)
            Image("LineSpacing")
            
            Text("You can use line spacing to add more space between lines of text. This text has no line spacing applied:")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .layoutPriority(1)
            
            Text("SwiftUI offers a Line Spacing modifier for situations where you want to increase the space between the lines of text on the screen.")
                .font(.title)
            
            Text("With Line Spacing of 16:")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
            
            Text("SwiftUI offers a Line Spacing modifier for situations where you want to increase the space between the lines of text on the screen.")
                .lineSpacing(16.0) // Add spacing between lines
                .font(.title)
            .minimumScaleFactor(0.5)
        }
        .ignoresSafeArea()
        .minimumScaleFactor(0.8)
    }
}

struct Text_LineSpacing_Previews : PreviewProvider {
    static var previews: some View {
        Text_LineSpacing()
    }
}
