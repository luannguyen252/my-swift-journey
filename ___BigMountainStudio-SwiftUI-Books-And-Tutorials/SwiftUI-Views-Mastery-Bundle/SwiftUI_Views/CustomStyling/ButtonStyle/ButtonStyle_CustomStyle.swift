//
//  ButtonStyle_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ButtonStyle_CustomStyle: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ButtonStyle").font(.largeTitle)
            Text("Custom Style").font(.title).foregroundColor(.gray)
            Text("You create button styles to reuse on your buttons in your project.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.red)
                .layoutPriority(2)
                .foregroundColor(.white)
            Button("Manually Modified", action: {})
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.blue, lineWidth: 2))
            Button("Using ButtonStyle", action: {})
                // Apply the style to just one button
                .buttonStyle(OutlineButtonStyle())
            Text("Notice the ButtonStyle loses its default blue accent color.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.red)
                .layoutPriority(1)
                .foregroundColor(.white)
        }.font(.title)
    }
}

struct OutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        // Apply modifiers to configuration.label  (button body)
        configuration.label
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.blue, lineWidth: 2))
    }
}

struct ButtonStyle_CustomStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle_CustomStyle()
    }
}
