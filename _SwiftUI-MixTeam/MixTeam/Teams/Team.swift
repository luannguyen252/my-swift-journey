//
//  Team.swift
//  MixTeam
//
//  Created by Renaud JENNY on 17/05/2017.
//  Copyright © 2017 Renaud JENNY. All rights reserved.
//

import UIKit

struct Team: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String = ""
    var colorIdentifier: ColorIdentifier = .gray
    var imageIdentifier: ImageIdentifier = .unknown
    var players: [Player] = []

    static func == (lhs: Self, rhs: Self) -> Bool { lhs.id == rhs.id }
}

#if DEBUG
extension Team {
    static var test: Self {
        Team(
            id: UUID(),
            name: "Team Test",
            colorIdentifier: .red,
            imageIdentifier: .koala,
            players: []
        )
    }
}
#endif
