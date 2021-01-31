//
//  ContentView.swift
//  SwiftUILoginPage
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedUsername = "Myusername"
let storedPassword = "Mypassword"

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @State var editingMode: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                WelcomeText()
                UserImage()
                UsernameTextField(username: $username, editingMode: $editingMode)
                PasswordSecureField(password: $password)

                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }

                Button(action: {
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    } else {
                        self.authenticationDidFail = true
                    }
                }) {
                    LoginButtonContent()
                }
            } //: VSTACK
            .padding()

            if authenticationDidSucceed {
                Text("Login succeeded!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            }
        } //: ZSTACK
        .offset(y: editingMode ? -150 : 0)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
