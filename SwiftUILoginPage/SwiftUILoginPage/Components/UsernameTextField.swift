//
//  UsernameTextField.swift
//  SwiftUILoginPage
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct UsernameTextField: View {
    // MARK: - PROPERTIES
    @Binding var username: String
    @Binding var editingMode: Bool
    
    // MARK: - BODY
    var body: some View {
        return TextField("Username", text: $username, onEditingChanged: { edit in
        if edit == true {
            self.editingMode = true
        } else {
            self.editingMode = false
        }
        })
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
    }
}

