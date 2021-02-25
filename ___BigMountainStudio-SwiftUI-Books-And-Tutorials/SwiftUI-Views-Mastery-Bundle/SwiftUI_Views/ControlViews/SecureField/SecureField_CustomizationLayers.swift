//
//  SecureField_Customization2.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SecureField_CustomizationLayers: View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text("SecureField")
                .font(.largeTitle)
            Text("Customization Layers")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can also add a background to the SecureField. It's all the same idea: adjust the layers.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            SecureField("password", text: $password)
                .foregroundColor(Color.white)
                .frame(height: 40)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .foregroundColor(.purple)
            )
                .padding(.horizontal)
            
            Image("SecureFieldLayers")
            
            Text("The highlighted layer in that image is the actual text field layer of the view.")
                .font(.title)
                .padding(.horizontal)
        }
    }
}

struct SecureField_CustomizationLayers_Previews: PreviewProvider {
    static var previews: some View {
        SecureField_CustomizationLayers()
    }
}
