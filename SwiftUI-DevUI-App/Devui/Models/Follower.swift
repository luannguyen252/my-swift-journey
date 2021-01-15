//
//  Follower.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

struct Follower: Identifiable, Decodable {
    let id: Int
    let username: String
    let name: String
    let path: String
    let profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case path
        case profileImage = "profile_image"
    }
}
