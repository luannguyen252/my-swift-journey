//
//  Article.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct Article: Decodable {
  let title: String
  let publication: String
  let imageURL: String
}
