//
//  Player.swift
//  NBA Finals Players
//
//  Created by zappycode on 6/3/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct Player: Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var team: Team
    var age: Int
    var height: String
    var weight: Int
}

struct Team {
    var color: Color
    var imageName: String
}

let goldenState = Team(color: Color(red: 0.965, green: 0.761, blue: 0.275), imageName: "gs")
let toronto = Team(color: Color(red: 0.718, green: 0.165, blue: 0.263), imageName: "tr")

let players = [
    Player(id: 0, name: "Andre Iguodala", imageName: "andre", team: goldenState, age: 35, height: "6' 6\"", weight: 215),
    Player(id: 1, name: "Danny Green", imageName: "danny", team: toronto, age: 31, height: "6' 6\"", weight: 215),
    Player(id: 2, name: "DeMarcus Cousins", imageName: "demarc", team: goldenState, age: 28, height: "6' 11\"", weight: 270),
    Player(id: 3, name: "Draymond Green", imageName: "dray", team: goldenState, age: 29, height: "6' 7\"", weight: 230),
    Player(id: 4, name: "Kawhi Leonard", imageName: "kawhi", team: toronto, age: 27, height: "6' 7\"", weight: 230),
    Player(id: 5, name: "Klay Thompson", imageName: "klay", team: goldenState, age: 29, height: "6' 7\"", weight: 215),
    Player(id: 6, name: "Kyle Lowry", imageName: "kyle", team: toronto, age: 33, height: "6' 1\"", weight: 196),
    Player(id: 7, name: "Marc Gasol", imageName: "marc", team: toronto, age: 34, height: "7' 1\"", weight: 255),
    Player(id: 8, name: "Pascal Siakam", imageName: "siak", team: toronto, age: 25, height: "6' 9\"", weight: 230),
    Player(id: 9, name: "Stephen Curry", imageName: "steph", team: goldenState, age: 31, height: "6' 3\"", weight: 190),
]

