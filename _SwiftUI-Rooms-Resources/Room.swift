//
//  Room.swift
//  Rooms
//
//  Created by Jan Zavrel on 23.12.2019.
//  Copyright © 2019 Jan Zavrel. All rights reserved.
//

import SwiftUI

struct Room: Identifiable {
    var id = UUID()
    var name: String
    var building: String
    var floor: String
    var capacity: Int
    var hasVideo: Bool = false
    var imageName: String
}

let testData = [
    Room(name: "Tree Room", building: "A", floor: "1", capacity: 6, hasVideo: true, imageName: "room01"),
    Room(name: "Lamp & Pillows", building: "B", floor: "1", capacity: 8, hasVideo: false, imageName: "room02"),
    Room(name: "Red Looks Great", building: "D", floor: "2", capacity: 16, hasVideo: true, imageName: "room03"),
    Room(name: "Bug On The Wall", building: "A", floor: "3", capacity: 10, hasVideo: true, imageName: "room04"),
    Room(name: "Candles", building: "C", floor: "3", capacity: 12, hasVideo: false, imageName: "room05"),
    Room(name: "Queen Size", building: "F", floor: "1", capacity: 8, hasVideo: false, imageName: "room06"),
    Room(name: "Small But Sweet", building: "E", floor: "1", capacity: 10, hasVideo: true, imageName: "room07"),
    Room(name: "Modern Screen", building: "B", floor: "4", capacity: 7, hasVideo: false, imageName: "room08"),
    Room(name: "Yellow Matrix", building: "D", floor: "3", capacity: 1, hasVideo: false, imageName: "room09")
]
