//
//  TextField_Autocorrection.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_Autocorrection: View {
    @State private var textFieldData = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text("TextField")
                .font(.largeTitle)
            Text("Autocorrection")
                .foregroundColor(.gray)
            Image("Autocorrect")
            Text("You may have noticed that space above some of the keyboard types that offer autocorrection. You can turn this off with the disableAutocorrection modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            
            TextField("Enter Last Name", text: $textFieldData)
                .disableAutocorrection(true) // Don't offer suggestions
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Enter City", text: $textFieldData)
                .disableAutocorrection(false) // Offer suggestions
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()
        }.font(.title)
    }
}

struct TextField_Autocorrection_Previews: PreviewProvider {
    static var previews: some View {
        TextField_Autocorrection()
    }
}
