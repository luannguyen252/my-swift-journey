//
//  Entry.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import Foundation

struct Entry {
    
    let id = UUID().uuidString
    var created = Date()
    var title: String
    var text: String
    var category: Category
}
