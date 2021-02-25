//
//  TextField_FontSize.swift
//  100Views
//
//  Created by Mark Moeykens on 6/28/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_FontSize : View {
    @State private var textFieldData = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField").font(.largeTitle)
            Text("With Text Modifiers").foregroundColor(.gray)
            Image("Font")
            Text("To change the size of the font used within the TextField, you just need to use the font modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            
            Group {
                TextField("first name", text: $textFieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("first name", text: $textFieldData)
                    .font(Font.system(size: 36, design: .monospaced))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("first name", text: $textFieldData)
                    .font(Font.system(size: 20, design: Font.Design.serif))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            Text("Notice this also changes the placeholder or hint text in the text field.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
        }
        .font(.title)
        .minimumScaleFactor(0.7)
    }
}

struct TextField_FontSize_Previews : PreviewProvider {
    static var previews: some View {
        TextField_FontSize()//.environment(\.colorScheme, .dark)
    }
}
