//
//  UserOnboardingDetails.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 11/12/2020.
//

import Foundation

class UserOnboardingDetails: ObservableObject {
  @Published var roomType = ""
  @Published var location = ""
  @Published var moveInDate = Date()
  @Published var maxRent: Double = 2500
}
