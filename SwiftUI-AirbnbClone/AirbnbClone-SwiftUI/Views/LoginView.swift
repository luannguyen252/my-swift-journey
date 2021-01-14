//
//  LoginView.swift
//  AirbnbClone-SwiftUI
//
//  Created by Keerthi on 23/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    @State var isPasswordEditing = false
    @State var isEmailEditing = false
    
    var emailView: some View {
        VStack {
            HStack {
                Image(systemName: "envelope")
                TextField("Email", text: self.$viewModel.email, onEditingChanged: { changed in
                    if changed {
                        self.isEmailEditing = true
                    } else {
                        self.isEmailEditing = false
                    }
                }, onCommit: {
                    self.isEmailEditing = false
                })
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            .padding(.horizontal, 16)
            if !self.isEmailEditing {
                Divider()
            }
        }
        .frame(height: 50)
        .background(Color.white)
        .cornerRadius(4)
        .shadow(color: Color.black.opacity(0.2), radius: self.isEmailEditing ? 4 : 0, x: 0, y: 0)
        .animation(.easeInOut)
    }
    
    var passwordView: some View {
        VStack {
            HStack {
                Image(systemName: "lock")
                SecureField("Paaword", text: self.$viewModel.password, onCommit: {
                    self.isPasswordEditing = false
                })
            }
            .padding(.horizontal, 16)
            if !self.isPasswordEditing {
                Divider()
            }
        }
        .frame(height: 50)
        .background(Color.white)
        .cornerRadius(4)
        .shadow(color: Color.black.opacity(0.2), radius: self.isPasswordEditing ? 4 : 0, x: 0, y: 0)
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(viewModel.isLoading)) {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Please sign in to continue")
                    .foregroundColor(.secondary)
                self.emailView
                self.passwordView
                HStack {
                    Spacer()
                    Button(action: {
                        if self.viewModel.isValidEmail(testStr: self.viewModel.email) == false {
                            
                        } else if self.viewModel.isValidPassword(testStr: self.viewModel.password) != nil {
                            
                        } else {
                            self.viewModel.callLoginService()
                        }
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Login")
                                .fontWeight(.bold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .frame(height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange,  Color.pink]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
