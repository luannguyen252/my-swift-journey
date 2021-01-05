//
//  Entry.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import Foundation

struct Entry: Codable {
    
    let id = UUID().uuidString
    var created = Date()
    var title: String
    var text: String
    var category: Category
}

var sampleEntries: [Entry] = {
    if let fileUrl = Bundle.main.url(forResource: "SampleEntries", withExtension: "json"),
        let data = try? Data(contentsOf: fileUrl) {
        let decoder = JSONDecoder()
        if let entries = try? decoder.decode([Entry].self, from: data) {
            return entries
        }
    }
    return []
}()
