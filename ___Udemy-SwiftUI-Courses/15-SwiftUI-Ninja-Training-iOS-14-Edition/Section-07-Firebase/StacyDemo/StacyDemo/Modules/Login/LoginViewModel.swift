//
//  LoginViewModel.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation


class LoginViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var loginSuccessful = false
  @Published var errorOccured = false
  @Published var loginError = ""
  
  private let authService = AuthService()
  
  func loginUser() {
    authService.loginUser(withEmail: email,
                          andPassword: password) { [self] error in
      if error == nil {
        loginSuccessful = true
      }
      else {
        errorOccured = true
        loginError = error!.localizedDescription
      }
    }
  }
}
