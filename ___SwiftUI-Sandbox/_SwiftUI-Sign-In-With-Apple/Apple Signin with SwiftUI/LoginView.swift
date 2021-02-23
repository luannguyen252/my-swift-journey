//
//  LoginView.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @Environment(\.window) var window : UIWindow?
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
       
    @State private var signInWithAppleDelegates : SignInWithAppleDelegates! = nil
       
    
    @State private var isAlertPresented = false
    @State private var errorDescription = ""
    
    
    var body: some View {
       
        SignInWithAppleButton().frame(width: 280, height: 60)
            .padding()
            .onTapGesture {
                self.showAppleLogin()
            }
    }
    

    
  func showAppleLogin(){
        

        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        performSignIn(using: [request])
    }
    
    private func performSignIn(using requests : [ASAuthorizationRequest]){

        signInWithAppleDelegates = SignInWithAppleDelegates(window: window, onSignedIn: { (result) in
            switch result {
                
            case .success(let userId):
                 self.signInWithAppleManager.isUserAuthenticated = .signedIn
                               print("userId[0] = \(userId[0])")
                               print("userId[1] = \(userId[1])")
                               print("userId[2] = \(userId[2])")
                               
                               UserDefaults.standard.set(userId[0], forKey: self.signInWithAppleManager.userIdentifierKey)
                               UserDefaults.standard.set(userId[1], forKey: self.signInWithAppleManager.email)
                                UserDefaults.standard.set(userId[2], forKey: self.signInWithAppleManager.username)
                self.signInWithAppleManager.isUserAuthenticated = .signedIn
            case .failure(let err):
                self.errorDescription = err.localizedDescription
                self.isAlertPresented = true
            }
        })

        let controller = ASAuthorizationController(authorizationRequests: requests)
        controller.delegate = signInWithAppleDelegates
        controller.presentationContextProvider = signInWithAppleDelegates

        controller.performRequests()
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
