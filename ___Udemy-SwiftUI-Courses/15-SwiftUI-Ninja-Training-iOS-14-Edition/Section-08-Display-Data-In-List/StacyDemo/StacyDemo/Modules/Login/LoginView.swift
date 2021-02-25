//
//  LoginView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 01/12/2020.
//

import SwiftUI

struct LoginView: View {
  @State private var showLogin = false
  
  @StateObject private var loginViewModel = LoginViewModel()
  
  let duration: Double = 0.3
  let delay = 0.3
  
  func animateViews() {
    DispatchQueue.main.async {
      withAnimation(Animation.easeIn(duration: duration)
                      .delay(delay + 0.6)) {
        showLogin = true
      }
    }
  }
  
    var body: some View {
      ZStack {
        NavigationView {
          VStack {
            ScreenTitle("Hi,\nWelcome back!")
            LoginFields(email: $loginViewModel.email, password: $loginViewModel.password)
            
            Button(action: {
              hideKeyboard()
              loginViewModel.loginUser()
            }) {
              Text("LOGIN")
                .textStyle(GradientButtonStyle())
                .padding(.top, 20)
                .opacity(showLogin ? 1 : 0)
                .offset(x: showLogin ? 0 : -200)
            }
            Spacer()
            HStack {
              Text("Don't have Stacy account?")
                .foregroundColor(.title)
              NavigationLink(
                destination: RegisterTypeView()
                  .environmentObject(UserOnboardingDetails())) {
                Text("Sign Up")
                  .foregroundColor(.blue)
              }
            }
            .padding(.bottom, 20)
            .opacity(showLogin ? 1 : 0)
          }
          .onAppear {
              animateViews()
          }
          .alert(isPresented: $loginViewModel.errorOccured) {
            Alert(title: Text("Error"), message: Text(loginViewModel.loginError))
          }
        }//navigationview
        if loginViewModel.loginSuccessful {
          HomeView()
        }
      }//zstack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

fileprivate struct LoginFields: View {
  @Binding var email: String
  @Binding var password: String
  
  @State private var showLogin = false
  @State private var showEmail = false
  @State private var showPassword = false
  
  let duration: Double = 0.3
  let delay = 0.3
  let xOffset: CGFloat = -200
  
  func animateViews() {
    DispatchQueue.main.async {
      
      withAnimation(Animation.easeOut(duration: duration)
                      .delay(delay + 0.2)) {
        showEmail = true
      }
      
      withAnimation(Animation.easeOut(duration: duration)
                      .delay(delay + 0.4)) {
        showPassword = true
      }
      
      withAnimation(Animation.easeIn(duration: duration)
                      .delay(delay + 0.6)) {
        showLogin = true
      }
    }
  }
  
  var body: some View {
    VStack {
      VStack(spacing: 16) {
        EmailField(email: $email)
          .padding(.horizontal, 20)
          .opacity(showEmail ? 1 : 0)
          .offset(x:showEmail ? 0 : xOffset)
        
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
        .opacity(showPassword ? 1 : 0)
        .offset(x:showPassword ? 0 : xOffset)
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
      .opacity(showLogin ? 1 : 0)
    }
    .onAppear {
      animateViews()
    }
  }
}
