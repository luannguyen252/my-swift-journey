//
//  RegisterViewModel.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation

class RegisterViewModel: ObservableObject {
  @Published var fullName = ""
  @Published var phoneNumber = ""
  @Published var selectedGender = 0
  @Published var email = ""
  @Published var password = ""
  @Published var confirmPassword = ""
  @Published var moreAboutYou = ""
  
  @Published var registrationSuccessful = false
  @Published var errorOccured = false
  @Published var registerError = ""
  @Published var loading = false
  
  let gender = ["Male", "Female", "Other"]
  
  private let userValidator = UserValidator()
  private let authService = AuthService()
  
  func register(with onboardingDetails: UserOnboardingDetails) {
    let user = User(email: email, fullName: fullName, phoneNumber: phoneNumber, gender: gender[selectedGender], password: password, confirmPassword: confirmPassword, moreAboutYou: moreAboutYou)
    
    if !userValidator.isValid(user: user) {
      errorOccured = true
      registerError = "Some fields are not correct, please check."
      return
    }
    user.set(onboardingDetails: onboardingDetails)
    loading = true
    
    authService.register(user: user) { [self] error in
      guard error == nil else {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
          loading = false
          registrationSuccessful = false
          errorOccured = true
          registerError = error!.localizedDescription
        }
        return
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
        loading = false
        registrationSuccessful = true
      }
    }
  }
}
