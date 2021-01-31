//
//  FormSnippet.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct FormSnippet: View {
    var body: some View {
        Form {
            Section(header: HeaderView(), footer: Text("Footer")) {
                // 1.
                Text("Placeholder")
                
                // 2.
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
}

#if DEBUG
struct FormSnippet_Previews: PreviewProvider {
    static var previews: some View {
        FormSnippet()
    }
}
#endif

// MARK: - HEADER VIEW
struct HeaderView: View {
    var body: some View {
        Text("Header")
            .font(.title)
            .bold()
    }
}
