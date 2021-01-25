//
//  Constants.swift
//  Connect 3 Game
//
//  Created by Sergey Sevriugin on 27/12/2019.
//  Copyright © 2019 Sergey Sevriugin. All rights reserved.
//

import UIKit

struct K {
    static let bpardImg = "board"
    static let scorefile = "score.json"
    static let me = "yellow"
    static let you = "red"
    static let dimension = 3
    static let maxDimension = 6
    static let minDimension = 3
    struct Score {
        static let size: CGFloat = 70.0
    }
    struct Board {
        static let size: CGFloat = 375.0
        static let padding: CGFloat = -7
    }
    struct Button {
        static let width: CGFloat = 80.0
        static let height: CGFloat = 50.0
        static let radius: CGFloat = 10.0
        static let text: String = "New"
    }
    struct Cell {
        static let size: CGFloat = 100.0
        static let padding: CGFloat = 11.0
    }
}
