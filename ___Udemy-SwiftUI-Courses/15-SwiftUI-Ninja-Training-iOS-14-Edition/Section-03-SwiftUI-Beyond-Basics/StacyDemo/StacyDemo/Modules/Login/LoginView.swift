//
//  LoginView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 01/12/2020.
//

import SwiftUI

struct LoginView: View {
  @State var email: String = ""
  @State var password: String = ""
  
    var body: some View {
      NavigationView {
        VStack {
          ScreenTitle("Hi,\nWelcome back!")
          VStack(spacing: 16) {
            EmailField(email: $email)
              .padding(.horizontal, 20)
            
            HStack {
              Image(systemName: "key")
                .foregroundColor(Color.text.opacity(0.7))
            SecureField("Password", text: $password)
              .padding(.leading, 8)
            }
              .font(.title3)
              .padding(8)
              .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.text.opacity(0.7), lineWidth: 1))
              .padding(.horizontal, 20)
          }
          
          HStack {
            Spacer()
            NavigationLink(destination: PasswordResetView()) {
              Text("Forgot Password?")
                .foregroundColor(.text)
            }
          }
          .padding(.top, 10)
          .padding(.horizontal, 20)
          
          Button(action: {}) {
            Text("LOGIN")
              .textStyle(GradientButtonStyle())
              .padding(.top, 20)
          }
          Spacer()
          HStack {
            Text("Don't have Stacy account?")
              .foregroundColor(.title)
            NavigationLink(
              destination: RegisterTypeView()) {
              Text("Sign Up")
                .foregroundColor(.blue)
            }
          }
          .padding(.bottom, 20)
        }
      }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
