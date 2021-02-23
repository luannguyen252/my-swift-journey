//
//  jsonModel.swift
//  jsonExample
//
//  Created by Arnav Motwani on 20/02/21.
//

import Foundation

// Heres the struct I used to model the data
struct jsonModel: Hashable, Codable, Identifiable {
    var id: UUID
    var valueOne: String
    var valueTwo: String
}
