//
//  Bundle+Decodable.swift
//  Moonshot
//
//  Created by Nicholas Fox on 1/6/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import Foundation


extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    guard
      let url = self.url(forResource: file, withExtension: nil),
      let data = try? Data(contentsOf: url)
      else { fatalError("Failed to load file") }

    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "y-MM-dd"
    decoder.dateDecodingStrategy = .formatted(formatter)
    
    guard let decoded = try? decoder.decode(T.self, from: data) else {
      fatalError("Decoding Failed")
    }
    return decoded
  }
}
