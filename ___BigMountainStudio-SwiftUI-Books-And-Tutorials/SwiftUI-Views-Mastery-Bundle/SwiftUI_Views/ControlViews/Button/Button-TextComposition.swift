//
//  Button-TextModifiers.swift
//  For Book
//

import SwiftUI

struct Button_TextModifiers : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button").font(.largeTitle)
            Text("Text Composition").foregroundColor(.gray)
            Text("You can add more than one text view to a button. By default, the views are composed within an HStack.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white).font(.title)
            
            Button(action: {}, label: {
                Text("Forgot Password?")
                Text("Tap to Recover")
                    .foregroundColor(.orange)
            })
            
            Text("Using a VStack")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
            
            Button(action: {}, label: {
                VStack {
                    Text("New User")
                    Text("(Register Here)").font(.body)
                }
            })
        }.font(.title)
    }
}

struct Button_TextModifiers_Previews : PreviewProvider {
    static var previews: some View {
        Button_TextModifiers()
    }
}
