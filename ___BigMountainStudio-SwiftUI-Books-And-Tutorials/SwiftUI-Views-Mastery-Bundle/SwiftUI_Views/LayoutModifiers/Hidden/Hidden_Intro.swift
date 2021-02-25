//
//  Hidden_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Hidden_Intro: View {
    @State private var showShapes = false
    var body: some View {
        VStack(spacing: 10) {
            Text("Hidden").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("When hidden is used on a view, you no longer see the content but the frame of the view is still there occupying space.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            if showShapes {
                OrangeRectangle()
                    .overlay(Text("Showing hidden shape")
                        .foregroundColor(.black))
            } else {
                OrangeRectangle()
                    .hidden()
                    .overlay(Text("This shape is hidden but it is still occupying space"))
            }
            
            OrangeRectangle()
            OrangeRectangle()
            
            Button(action: {
                self.showShapes.toggle()
            }) {
                Text("Show/Hide View")
            }
        }
    }
}

struct Hidden_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Hidden_Intro()
    }
}

struct OrangeRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.orange)
    }
}
