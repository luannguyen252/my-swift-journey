//
//  NetworkModel.swift
//  NetworkingUI
//
//  Created by Philipp Baldauf on 20.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation

//https://jsoneditoronline.org/#left=local.lumiqo&right=local.ragilu

struct People: Codable {
    
    var next: String?
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
