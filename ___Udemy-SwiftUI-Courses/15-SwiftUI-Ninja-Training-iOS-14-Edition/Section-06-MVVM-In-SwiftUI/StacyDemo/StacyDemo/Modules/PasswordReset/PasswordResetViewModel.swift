//
//  PasswordResetViewModel.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation

class PasswordResetViewModel: ObservableObject {
  @Published var email = ""
  @Published var showingAlert = false
  
  private let authService = AuthService()
  
  func sendPasswordReset() {
    authService.sendPasswordReset(email: email) { [self] in
      showingAlert = true
    }
  }
}
