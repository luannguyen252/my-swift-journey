//
//  TextFieldStyle_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextFieldStyle_Intro: View {
    @State private var textFieldData = ""
    var body: some View {
        VStack(spacing: 15) {
            Text("Text Field Style").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("You can start with a plain looking text field style (default) and modify it. Or you can go with the rounded border style.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Group {
                Text("DefaultTextFieldStyle").font(.title)
                TextField("DefaultTextFieldStyle", text: $textFieldData)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                Text("PlainTextFieldStyle").font(.title)
                TextField("PlainTextFieldStyle", text: $textFieldData)
                    .textFieldStyle(PlainTextFieldStyle())
                
                Text("RoundedBorderTextFieldStyle").font(.title)
                TextField("RoundedBorderTextFieldStyle", text: $textFieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
    }
}

struct TextFieldStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStyle_Intro()
    }
}
