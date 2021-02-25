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
  
  private let authService = AuthService()
  
  func loginUser() {
    authService.loginUser(withEmail: email,
                          andPassword: password) { [self] error in
      //TODO check error and show alert if there are errors
      loginSuccessful = true
    }
  }
}
