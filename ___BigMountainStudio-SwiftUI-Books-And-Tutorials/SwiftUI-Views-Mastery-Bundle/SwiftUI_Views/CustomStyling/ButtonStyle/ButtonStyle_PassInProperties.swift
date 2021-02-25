//
//  ButtonStyle_PassInProperties.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ButtonStyle_PassInProperties: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ButtonStyle").font(.largeTitle)
            Text("Pass In Property Values").foregroundColor(.gray)
            Text("You may not always want to hard-code style values. Create properties for values you want to pass in.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .layoutPriority(2)
                .foregroundColor(.white)
            
            Button("Default OutlineButtonStyle", action: {})
                .buttonStyle(OutlineButtonStyle())
            
            Button("Red OutlineButtonStyle", action: {})
            //        .buttonStyle(OutlineButtonStyle(buttonColor: .red))
            
            Button("Purple OutlineButtonStyle", action: {})
            //        .buttonStyle(OutlineButtonStyle(buttonColor: .purple))
            
        }.font(.title)
    }
}

//struct OutlineButtonStyle: ButtonStyle {
//    // Create properties for your modifiers to use.
//    var buttonColor = Color.blue
//    
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .opacity(configuration.isPressed ? 0.2 : 1)
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .strokeBorder(buttonColor, lineWidth: 2))
//            .foregroundColor(buttonColor)
//    }
//}

struct ButtonStyle_PassInProperties_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle_PassInProperties()
    }
}
