//
//  Post.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 12/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

struct Post {
    let id: Int
    let user: User?
    
    var imageName: String {
        return "Photos/\(id)"
    }
}

extension Post: Hashable {}
extension Post: Codable {}
