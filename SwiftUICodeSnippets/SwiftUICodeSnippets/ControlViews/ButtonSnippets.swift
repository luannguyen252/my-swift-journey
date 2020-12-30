//
//  ButtonSnippets.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ButtonSnippets: View {
    var body: some View {
        VStack(spacing: 16) {
            // 1.
            Button("Click Me", action: {
                print("Button Pressed!")
            })
            
            // 2.
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Text("Click Me")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule().fill(Color("AccentColor")))
            })
            
            // 3.
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Text("Click Me")
                    .padding()
                    .background(Capsule().stroke(Color("AccentColor"), lineWidth: 1))
            })
            
            // 4.
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Text("Click Me")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            })
        }
    }
}

#if DEBUG
struct ButtonSnippets_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSnippets()
    }
}
#endif
