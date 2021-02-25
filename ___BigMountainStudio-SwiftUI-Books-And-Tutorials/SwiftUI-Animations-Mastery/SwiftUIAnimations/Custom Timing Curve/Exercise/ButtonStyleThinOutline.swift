//
//  ButtonStyleLightOutline.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/25/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ButtonStyleThinOutline: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(Color("Accent4"))
                .opacity(0.1))
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color("Accent4"), lineWidth: 0.7))
    }
}

struct ButtonStyleThinOutline_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Secondary4")
                .edgesIgnoringSafeArea(.all)
            
            Button("Test How This Button Looks") { }
                .buttonStyle(ButtonStyleThinOutline())
        }
    }
}
