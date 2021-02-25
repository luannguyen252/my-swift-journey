//
//  UserValidator.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation

struct UserValidator {
  
  func isValid(user: User) -> Bool {
    
    guard !user.email.isEmpty else { return false }
    guard !user.fullName.isEmpty else { return false }
    guard !user.phoneNumber.isEmpty else { return false }
    guard !user.password.isEmpty else { return false }
    guard !user.confirmPassword.isEmpty else { return false }
    
    return true
  }
}
