//
//  Player.swift
//  MixTeam
//
//  Created by Renaud JENNY on 07/05/2017.
//  Copyright © 2017 Renaud JENNY. All rights reserved.
//

import UIKit
import SwiftUI

struct Player: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String = ""
    var imageIdentifier: ImageIdentifier

    static func == (lhs: Self, rhs: Self) -> Bool { lhs.id == rhs.id }
}

#if DEBUG
extension Player {
    static var test: Self {
        Player(id: UUID(), name: "Test", imageIdentifier: .girl)
    }
}
#endif
