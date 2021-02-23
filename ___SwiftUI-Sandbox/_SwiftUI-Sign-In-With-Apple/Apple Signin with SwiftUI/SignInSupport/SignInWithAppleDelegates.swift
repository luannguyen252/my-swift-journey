//
//  SceneDelegate.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInWithAppleDelegates: NSObject {
    private let signInSucceeded: (Result<[String], Error>) -> ()
    private weak var window: UIWindow!
    
    init(window: UIWindow?, onSignedIn: @escaping (Result<[String], Error>) -> ()) {
        self.window = window
        self.signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
    private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        print("Registering new account with user: \(credential.user)")
        self.signInSucceeded(.success([credential.user, (credential.email ?? "Not available"), (credential.fullName?.givenName ?? "Not available"), (credential.fullName?.familyName ?? "Not available")]))
//        self.signInSucceeded(.success([credential.user, (credential.email ?? "Not available"), (credential.fullName ?? "Not available")]))
    }
    
    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
        print("Signing in with existing account with user: \(credential.user)")
        self.signInSucceeded(.success([credential.user, (credential.email ?? "Not available"), (credential.email ?? "Not available")]))
//        self.signInSucceeded(.success(credential.user))
    }
    
    private func signInWithUserAndPassword(credential: ASPasswordCredential) {
        print("Signing in using an existing iCloud Keychain credential with user: \(credential.user)")
        self.signInSucceeded(.success([credential.user]))
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
//         let userIdentifier = appleIDCredential.user
        //            let userFirstName = appleIDCredential.fullName?.givenName
        //            let userLastName = appleIDCredential.fullName?.familyName
        //            let userEmail = appleIDCredential.email
        
        
        
        
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            if let email = appleIdCredential.email, let userName = appleIdCredential.fullName {
                print(email)
                print(userName.givenName)
                print(userName.familyName)
                registerNewAccount(credential: appleIdCredential)
            } else {
                signInWithExistingAccount(credential: appleIdCredential)
      
            }
            
            break
            
        case let passwordCredential as ASPasswordCredential:
            signInWithUserAndPassword(credential: passwordCredential)
            
            break
            
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.signInSucceeded(.failure(error))
        
    }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.window
    }
}
