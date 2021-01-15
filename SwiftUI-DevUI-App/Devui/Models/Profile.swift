//
//  Profile.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

struct Profile: Identifiable, Decodable {
    
    let id: Int
    let username: String
    let name: String
    let summary: String
    let profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case summary
        case profileImage = "profile_image"
    }
}
