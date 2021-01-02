//
//  UsernameTextField.swift
//  LoginPage
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct UsernameTextField: View {
    // MARK: - PROPERTIES
    @Binding var username: String
    
    // MARK: - BODY
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(4)
    }
}
