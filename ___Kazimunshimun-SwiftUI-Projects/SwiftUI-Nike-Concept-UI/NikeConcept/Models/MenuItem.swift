//
//  MenuItem.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    var selected = false
}
