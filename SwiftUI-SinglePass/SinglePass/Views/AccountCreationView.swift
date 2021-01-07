//
//  AccountCreationView.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

struct AccountCreationView: View {
  @Binding var showLogin: Bool
  @State private var email = ""
  @State private var password = ""
  @State private var confirmedPassword = ""
  @State private var formOffset: CGFloat = 0

  var body: some View {
    SubscriptionView(
      content: createContent(),
      publisher: NotificationCenter.keyboardPublisher
      ) { frame in
      withAnimation {
        self.formOffset = frame.height > 0 ? -200 : 0
      }
    }
  }

  private func goToLoginButton() -> some View {
    Button(
      action: {
        withAnimation(.spring()) {
          self.showLogin.toggle()
        }
      },
      label: {
        HStack {
          Text("Login")
            .accentColor(.darkerAccent)

          Image(systemName: "arrow.right.square.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 20)
            .foregroundColor(Color.darkerAccent)
        }
      }
    )
  }

  private func createContent() -> some View {
    VStack {
      Image("singlePass-dynamic")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 30)
        .padding(.bottom)

      VStack(spacing: 10) {
        Text("Create Account")
          .font(.title)
          .bold()

        VStack(spacing: 30) {
          SharedTextField(
            value: self.$email,
            header: "Email",
            placeholder: "Your primary email",
            errorMessage: ""
          )

          PasswordField(
            value: self.$password,
            header: "Password",
            placeholder: "Make sure it's string",
            errorMessage: "",
            isSecure: true
          )

          PasswordField(
            value: self.$confirmedPassword,
            header: "Confirm Password",
            placeholder: "Must match the password",
            errorMessage: "",
            isSecure: true
          )

          LCButton(text: "Sign up", backgroundColor: .accent) {
            // To be implemented
          }
        }
        .modifier(FormModifier())
        .offset(y: self.formOffset)

        goToLoginButton()
      }
    }
  }
}

struct AccountCreationView_Previews: PreviewProvider {
  static var previews: some View {
    AccountCreationView(showLogin: .constant(false))
  }
}
