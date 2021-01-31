//
//  TextFieldSnippets.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct TextFieldSnippets: View {
    @State private var textField = ""
    @State private var secureField = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("TextField Snippets")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            // 1.
            TextField("Username", text: $textField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // 2.
            SecureField("Password", text: $textField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // 3.
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("Email Address", text: $textField)
            }
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black.opacity(0.1), lineWidth: 1))
            
            // 4.
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("Email Address", text: $textField)
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.black.opacity(0.05)))
            
            Spacer()
        }
        .padding()
    }
}

#if DEBUG
struct TextFieldSnippets_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldSnippets()
    }
}
#endif
