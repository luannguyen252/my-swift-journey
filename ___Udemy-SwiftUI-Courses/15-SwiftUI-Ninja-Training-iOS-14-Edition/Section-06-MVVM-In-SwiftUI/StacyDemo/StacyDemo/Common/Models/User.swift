//
//  User.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation

class User {
  let email: String
  let fullName: String
  let phoneNumber: String
  let gender: String
  let password: String
  let confirmPassword: String
  let moreAboutYou: String
  
  init(email: String,
       fullName: String,
       phoneNumber: String,
       gender: String,
       password: String,
       confirmPassword: String,
       moreAboutYou: String) {
    self.email = email
    self.fullName = fullName
    self.phoneNumber = phoneNumber
    self.gender = gender
    self.password = password
    self.confirmPassword = confirmPassword
    self.moreAboutYou = moreAboutYou
  }
}
