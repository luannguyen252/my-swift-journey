//
//  HouseDataModel.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 02.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import Foundation

struct HouseDataModel {
    let url: URL
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
    let titles: [String]
    let seats: [String]
    let currentLord: URL?
    let heir: URL?
    let overlord: URL?
    let founded: String
    let founder: URL?
    let diedOut: String
    let ancestralWeapons: [String]
    let cadetBranches: [URL]
    let swornMembers: [URL]
}
