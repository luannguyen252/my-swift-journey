//
//  LoginView.swift
//  SimpleLoginSystem
//
//  Created by Gaspard Rosay on 27.01.20.
//  Copyright © 2020 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var loginSettings: LoginSettings
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Image("lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:(geometry.size.height / 3) )
                    .clipped()
                    .padding(.bottom, 50)
                
                TextField("Username...", text: self.$username)
                    .frame(width: geometry.size.height - 50, height: 30)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    .cornerRadius(5.0)
                SecureField("Password...", text: self.$password)
                    .frame(width: geometry.size.height - 50, height: 30)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    .cornerRadius(5.0)
                Spacer()
                    .frame(height: 20)
                Button(action: {
                    self.loginSettings.showLoginPage = false
                })
                {
                    Text("Connect!")
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 250, height: 60)
                .background(Color(red: 67/255, green: 110/255, blue: 79/255, opacity: 1.0))
                .cornerRadius(15.0)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
