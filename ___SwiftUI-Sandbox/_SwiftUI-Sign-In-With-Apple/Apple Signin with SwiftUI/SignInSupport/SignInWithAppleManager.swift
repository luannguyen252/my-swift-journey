//
//  SceneDelegate.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import SwiftUI
import AuthenticationServices

class SignInWithAppleManager: ObservableObject {
    
    @Published var isUserAuthenticated: AuthState = .undefined
    let userIdentifierKey = "userIdentifier"
    let email = "email"
    let username = "userName"

    
    func checkUserAuth(completion: @escaping (AuthState) -> ()) {
        guard let userIdentifier = UserDefaults.standard.string(forKey: userIdentifierKey) else {
            print("User identifier does not exist")
            self.isUserAuthenticated = .undefined
            completion(.undefined)
            return
        }
        if userIdentifier == "" {
            print("User identifier is empty string")
            self.isUserAuthenticated = .undefined
            completion(.undefined)
            return
        }
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
            DispatchQueue.main.async {
                switch credentialState {
                case .authorized:
                    // The Apple ID credential is valid. Show Home UI Here
                    print("Credential state: .authorized")
                    self.isUserAuthenticated = .signedIn
                    completion(.signedIn)
                    break
                case .revoked:
                    // The Apple ID credential is revoked. Show SignIn UI Here.
                    print("Credential state: .revoked")
                    self.isUserAuthenticated = .undefined
                    completion(.undefined)
                    break
                case .notFound:
                    // No credential was found. Show SignIn UI Here.
                    print("Credential state: .notFound")
                    self.isUserAuthenticated = .signedOut
                    completion(.signedOut)
                    break
                default:
                    break
                }
            }
        }
    }
    
}

