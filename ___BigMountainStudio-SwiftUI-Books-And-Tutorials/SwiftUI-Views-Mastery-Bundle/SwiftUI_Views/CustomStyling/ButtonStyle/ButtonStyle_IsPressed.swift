//
//  ButtonStyle_IsPressed.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ButtonStyle_IsPressed: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ButtonStyle").font(.largeTitle)
            Text("Style for isPressed").foregroundColor(.gray)
            Text("The ButtonStyle's configuration parameter in the makeBody function exposes the isPressed property that you can evaluate and style the button differently when the button is pressed or tapped.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
            Button("Manually Modified", action: {})
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.blue, lineWidth: 2))
            Button("Using ButtonStyle", action: {})
                .buttonStyle(OutlineButtonStyle())
            Text("Now the two buttons match completely.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

//struct OutlineButtonStyle: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            // Make the text flash when pressed
//            .opacity(configuration.isPressed ? 0.2 : 1)
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .strokeBorder(Color.blue, lineWidth: 2))
//            .foregroundColor(.blue)
//            // Make the text AND border flash when pressed
//            //.opacity(configuration.isPressed ? 0.2 : 1)
//    }
//}

struct ButtonStyle_IsPressed_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle_IsPressed()
    }
}
