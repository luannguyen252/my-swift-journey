//
//  ButtonStyle_TextColor.swift
//  100Views
//
//  Created by Mark Moeykens on 9/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ButtonStyle_TextColor: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ButtonStyle").font(.largeTitle)
            Text("Text Color").foregroundColor(.gray)
            Text("You might think you can use accentColor modifier. But this doesn't work. You have to use the foregroundColor modifier.")
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
            Text("There is one more thing that this button is lacking. It doesn't flash like the Manually Modified button when you tap it.")
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
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .strokeBorder(Color.blue, lineWidth: 2))
//            .foregroundColor(.blue) // Make text color blue
//    }
//}

struct ButtonStyle_TextColor_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle_TextColor()
    }
}
