//
//  TextField_Disabled.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TextField_Disabled: View {
    @State private var lastName = "Moeykens"
    @State private var city = "Salt Lake City"
    @State private var disabled = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("TextField")
                .font(.largeTitle)
            Text("Disabled")
                .foregroundColor(.gray)
            
            Image("Disabled")
            
            Text("You may need to conditionally enable/disable text fields. Just use the disabled modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            
            Toggle("Keep Info Private", isOn: $disabled)
                .padding(.horizontal)
            
            Group {
                TextField("Enter Last Name", text: $lastName)
                TextField("Enter City", text: $city)
            }
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .disabled(disabled) // Don't allow to edit when disabled
            .opacity(disabled ? 0.5 : 1) // Fade out when disabled
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct TextField_Disabled_Previews: PreviewProvider {
    static var previews: some View {
        TextField_Disabled()
    }
}
