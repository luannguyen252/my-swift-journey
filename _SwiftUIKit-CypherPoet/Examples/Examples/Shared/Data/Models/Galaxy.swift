//
// Galaxy.swift
// Examples
//
// Created by CypherPoet on 8/19/20.
// ✌️
//

import Foundation


struct Galaxy {
    let id = UUID()
    var name: String
}


extension Galaxy: Identifiable {}
extension Galaxy: Hashable {}


extension Galaxy {
    static let milkyWay = Galaxy(name: "Milky Way")
    static let andromeda = Galaxy(name: "Andromeda")
    static let cartwheel = Galaxy(name: "Cartwheel")
    static let eyeOfSauron = Galaxy(name: "Eye of Sauron")
}
