//
//  Book.swift
//  MyBooks
//
//  Created by Stewart Lynch on 2020-08-28.
//

import Foundation

struct Book: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var author: String
    var notes: String
    var isSample:Bool = false
}
