//
//  LoginView.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct LoginView: View {
    // MARK: - PROPERTIES
    @State var usernameInput = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - LOGIN
            Text("Login")
                .font(.title)
                .padding(.top, 100)
                .padding(.bottom, 170)
            
            // MARK: - USERNAME
            Text("Please choose a username")
            
            TextField("Enter username...", text: $usernameInput)
                .padding()
                .frame(height: 50)
                .background(Color("LightGrayColor"))
                .cornerRadius(10)
                .padding()
            
            Spacer()
            
            // MARK: - LOGIN BUTTON
            Button(action: {self.signIn()}) {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            
            Spacer()
        } //: VSTACK
    }
    
    // MARK: - CHECK WHEN USER SIGN IN
    func signIn() {
        guard !usernameInput.isEmpty else {
            return
        }
        
        let defaults = UserDefaults.standard
        defaults.set(usernameInput, forKey: "username")
        
        viewRouter.currentPage = .chatView // After sign in user stay in the chat view
    }
}

// MARK: - PREVIEW
#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
