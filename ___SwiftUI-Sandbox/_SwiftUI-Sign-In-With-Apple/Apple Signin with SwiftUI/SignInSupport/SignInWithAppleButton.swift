//
//  SceneDelegate.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import SwiftUI
import AuthenticationServices

final class SignInWithAppleButton: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<SignInWithAppleButton>) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: SignInWithAppleButton.UIViewType, context: UIViewRepresentableContext<SignInWithAppleButton>) {
    }
}
