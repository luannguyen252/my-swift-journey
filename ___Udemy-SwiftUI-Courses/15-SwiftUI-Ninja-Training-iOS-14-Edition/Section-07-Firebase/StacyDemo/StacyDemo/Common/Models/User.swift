//
//  User.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 15/12/2020.
//

import Foundation
import FirebaseFirestoreSwift

class User: Identifiable, Codable {
  @DocumentID var id: String?
  
  var userId = ""
  let email: String
  let fullName: String
  let phoneNumber: String
  let gender: String
  var password: String = ""
  var confirmPassword: String = ""
  let moreAboutYou: String
  //onboarding details
  var roomType = ""
  var location = ""
  var moveInDate = Date()
  var maxRent: Double = 0
  
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
  
  func set(onboardingDetails: UserOnboardingDetails) {
    roomType = onboardingDetails.roomType
    location = onboardingDetails.location
    moveInDate = onboardingDetails.moveInDate
    maxRent = onboardingDetails.maxRent
  }
  
  private enum CodingKeys: String, CodingKey {
    case userId,
         email,
         fullName,
         gender,
         phoneNumber,
         moreAboutYou,
         roomType,
         location,
         moveInDate,
         maxRent
  }
}
