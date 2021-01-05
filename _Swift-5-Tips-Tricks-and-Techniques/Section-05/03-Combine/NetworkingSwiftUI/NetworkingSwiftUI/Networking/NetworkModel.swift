//
//  NetworkModel.swift
//  NetworkingSwiftUI
//
//  Created by Philipp Baldauf on 22.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation

struct People: Codable {
    var results: [Character]
}

struct Character: Codable, Identifiable {
    
    let id: String
    let name: String
    let hairColor: String
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
        case hairColor = "hair_color"
    }
}
