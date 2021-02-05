//
//  User.swift
//  DynamicList-SwiftUI-Combine
//
//  Created by Farooq Rasheed on 13/01/2020.
//  Copyright © 2020 Farooq Rasheed. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Hashable, Identifiable, Decodable {
    var id: Int64
    var login: String
    var avatar_url: URL
}
