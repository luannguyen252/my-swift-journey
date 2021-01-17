//
//  User.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 13/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

struct User {
    let id: Int
    let nickname: String
    let name: String
    let numberOfPosts: Int
    let numberOfFollowers: Int
    let numberFollowing: Int
    let description: String
    let posts: [Post]?
    let friends: [User]?
    
    var imageName: String {
        return "Photos/\(id)"
    }
}

extension User: Codable {}
extension User: Hashable {}
