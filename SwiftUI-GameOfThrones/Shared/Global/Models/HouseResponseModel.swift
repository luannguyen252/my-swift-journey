//
//  HouseResponseModel.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 01.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import Foundation

struct HouseResponseModel: Codable {
    let url: URL?
    let name: String?
    let region: String?
    let coatOfArms: String?
    let words: String?
    let titles: [String]?
    let seats: [String]?
    let currentLord: String?
    let heir: String?
    let overlord: String?
    let founded: String?
    let founder: String?
    let diedOut: String?
    let ancestralWeapons: [String]?
    let cadetBranches: [URL]?
    let swornMembers: [URL]?
}
