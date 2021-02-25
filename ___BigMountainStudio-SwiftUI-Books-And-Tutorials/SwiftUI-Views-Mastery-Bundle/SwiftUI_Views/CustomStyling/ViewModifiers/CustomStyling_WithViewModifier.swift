//
//  CustomStyling_WithViewModifier.swift
//  100Views
//
//  Created by Mark Moeykens on 9/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CustomStyling_WithViewModifier: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ViewModifier").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Create a view modifier where you see repeated modifiers being used.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.red)
                .foregroundColor(.white)
            
            Text("I created a view modifier for the formatting of this text banner.")
                .modifier(TextBanner())
            
            Spacer()
        }
    }
}

// Create a struct that conforms to ViewModifier
struct TextBanner: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.title).padding()
            .background(Color.red)
            .foregroundColor(.white)
    }
}

struct CustomStyling_WithViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomStyling_WithViewModifier()
    }
}
