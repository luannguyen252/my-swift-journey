//
//  ContentView.swift
//  LoginPage
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var username = ""
    @State var password = ""
    
    @State var authenticationDidFail = false
    @State var authenticationDidSucceed = false
    
    let storedUsername = "Myusername"
    let storedPassword = "Mypassword"
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                // MARK: - WELCOME TEXT
                WelcomeText(welcomeText: "Welcome!")
                    .padding(.bottom, 16)
                
                // MARK: - USER IMAGE
                UserImage(profilePicture: "ProfilePicture")
                    .padding(.bottom, 72)
                
                // MARK: - USERNAME FIELD
                UsernameTextField(username: $username)
                    .padding(.bottom, 16)
                
                // MARK: - PASSWORD FIELD
                PasswordSecureField(password: $password)
                    .padding(.bottom, 16)
                
                // MARK: - VERIFY AUTHENTICATION
                if authenticationDidFail {
                    Text("Entered credentials incorrect. Try again.")
                       .padding(.bottom, 15)
                       .foregroundColor(.red)
                }
                
                // MARK: - LOGIN BUTTON
                Button(action: {
                    if username == storedUsername && password == storedPassword {
                        authenticationDidSucceed = true
                        authenticationDidFail = false
                    } else {
                        authenticationDidFail = true
                    }
                }, label: {
                    LoginButton(loginText: "Login")
                })
            }
            .padding()
            
            if authenticationDidSucceed {
                Text("Login successful!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
