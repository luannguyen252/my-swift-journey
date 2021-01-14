//
//  Visit.swift
//  QuickCardSwiftUI
//
//  Created by Umer Khan on 24/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import Foundation
struct Visit: Identifiable {
  let id = UUID()
  var views: Int
  var events: Int
  var badges: Int
  var actions: Int
  var duration: Int
}
