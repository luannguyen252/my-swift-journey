//
//  PasswordSecureField.swift
//  SwiftUILoginPage
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct PasswordSecureField: View {
    // MARK: - PROPERTIES
    @Binding var password: String
    
    // MARK: - BODY
    var body: some View {
        return SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
