//
//  TextField_Placeholder.swift
//  100Views
//
//  Created by Mark Moeykens on 6/28/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_Placeholder : View {
    @State private var textFieldData = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            
            Text("Title Text (Placeholder or Hint)")
                .foregroundColor(.gray)
            
            Text("You can supply title text (placeholder/hint text) through the first parameter to let the user know the purpose of the text field.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange)
            
            Group {
                TextField("Here is title text", text: $textFieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("User name", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }.font(.title)
    }
}

struct TextField_Placeholder_Previews : PreviewProvider {
    static var previews: some View {
        TextField_Placeholder()
    }
}
