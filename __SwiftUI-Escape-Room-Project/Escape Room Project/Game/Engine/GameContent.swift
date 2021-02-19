//
//  GameContent.swift
//  Created by Julian Schiavo on 14/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

public enum GameContent {
    static let mastermindColors: [SimpleColor] = {
        var colors = [
            SimpleColor(red: 98, green: 187, blue: 71),
            SimpleColor(red: 252, green: 184, blue: 39),
            SimpleColor(red: 224, green: 58, blue: 60),
            SimpleColor(red: 150, green: 61, blue: 151),
            SimpleColor(red: 0, green: 157, blue: 220)
        ]
        colors.shuffle()
        return Array(colors.prefix(4))
    }()
}
