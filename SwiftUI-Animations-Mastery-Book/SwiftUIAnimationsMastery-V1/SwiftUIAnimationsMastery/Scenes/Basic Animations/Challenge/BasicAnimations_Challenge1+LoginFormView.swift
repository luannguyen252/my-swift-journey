//
//  BasicAnimations_Challenge+LoginFormView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

extension BasicAnimations_Challenge1 {
    struct LoginFormView {
        @State private var usernameText: String = ""
        @State private var passwordText: String = ""
    }
}

// MARK: - View
extension BasicAnimations_Challenge1.LoginFormView: View {
    var body: some View {
        VStack {
            Image(systemName: "lock.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.purple)
            
            Form {
                TextField("Username", text: $usernameText)
                    .textContentType(.username)
                
                TextField("Password", text: $passwordText)
                    .textContentType(.password)
            }
        }
    }
}

// MARK: - Computeds
extension BasicAnimations_Challenge1.LoginFormView {
}

// MARK: - View Variables
extension BasicAnimations_Challenge1.LoginFormView {
}

// MARK: - Private Helpers
private extension BasicAnimations_Challenge1.LoginFormView {
}

// MARK: - Preview
struct BasicAnimations_Challenge1_LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge1.LoginFormView()
    }
}
