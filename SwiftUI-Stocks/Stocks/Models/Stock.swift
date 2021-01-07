//
//  File.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct Stock: Decodable {
  let symbol: String
  let description: String
  let price: Double
  let change: String
}
