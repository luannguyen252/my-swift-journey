//
//  PasswordSecureField.swift
//  LoginPage
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct PasswordSecureField: View {
    // MARK: - PROPERTIES
    @Binding var password: String
    
    // MARK: - BODY
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(4)
    }
}
