//
//  LaunchScreenView.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import SwiftUI
import AuthenticationServices


struct LaunchScreenView: View {
   
    @Environment(\.window) var window : UIWindow?
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
    
    @State private var signInWithAppleDelegates : SignInWithAppleDelegates! = nil
    
     @State private var isAlertPresented = false
     @State private var errorDescription = ""
    
    var body: some View {
        VStack{
            
            Text("Launch Screen")
            
        }.onAppear {
            self.signInWithAppleManager.checkUserAuth { (authState) in
                switch authState {
                    
                case .undefined:
                    print("Auth State = .undefined")
                    self.performExistingAccountSetupFlow()
                case .signedOut:
                     print("Auth State = .signedOut")
                case .signedIn:
                     print("Auth State = .signedIn")
    
                }
            }
        }.alert(isPresented: $isAlertPresented) { () -> Alert in
            Alert(title: Text("ERROR"), message: Text(errorDescription), dismissButton: .default(Text("Ok"), action: {
                //set isUserAuthenticated to signed out
                self.signInWithAppleManager.isUserAuthenticated = .signedOut
            }))
        }
    }
    
    
    private func performExistingAccountSetupFlow() {
        #if !targetEnvironment(simolator)
        
        let requests = [
            ASAuthorizationAppleIDProvider().createRequest(),
            ASAuthorizationPasswordProvider().createRequest()
        ]
        performSignIn(using: requests)
        #endif
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
                
            case .failure(let err):
                self.errorDescription = err.localizedDescription
                self.signInWithAppleManager.isUserAuthenticated = .signedOut
//                self.isAlertPresented = true
            }
        })
        
        let controller = ASAuthorizationController(authorizationRequests: requests)
        controller.delegate = signInWithAppleDelegates
        controller.presentationContextProvider = signInWithAppleDelegates
        
        controller.performRequests()
    }
    
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
