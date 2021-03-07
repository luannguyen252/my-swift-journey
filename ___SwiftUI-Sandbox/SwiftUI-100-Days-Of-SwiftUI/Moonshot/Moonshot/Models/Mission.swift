//
//  Mission.swift
//  Moonshot
//
//  Created by Nicholas Fox on 1/6/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import Foundation



struct Mission: Codable, Identifiable {

  struct CrewRole: Codable {
    let name: String
    let role: String
  }

  let id: Int
  let launchDate: Date?
  let crew: [CrewRole]
  let description: String

  var displayName: String { "Apollo \(id)" }
  var imageName: String { "apollo\(id)" }

  var formattedLaunchDate: String {
    guard let launchDate = launchDate else { return "N/A" }
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter.string(from: launchDate)
  }
}
