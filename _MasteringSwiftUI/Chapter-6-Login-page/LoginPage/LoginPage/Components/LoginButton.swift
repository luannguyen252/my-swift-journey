//
//  LoginButton.swift
//  LoginPage
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct LoginButton: View {
    // MARK: - PROPERTIES
    @State var loginText: String
    
    // MARK: - BODY
    var body: some View {
        Text(loginText)
            .font(.headline)
            .foregroundColor(.white)
            .padding(10)
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(loginText: "Login")
    }
}
#endif
