//
//  Category.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import Foundation
import UIKit

enum Category: Int, Codable {
    
    case personal, work
    
    var name: String {
        switch self {
        case .personal:
            return "Personal"
        case .work:
            return "Work"
        }
    }
    
    var image: UIImage {
        switch self {
        case .personal:
            return UIImage(systemName: "person.circle")!
        case .work:
            return UIImage(systemName: "folder.circle")!
        }
    }
}
