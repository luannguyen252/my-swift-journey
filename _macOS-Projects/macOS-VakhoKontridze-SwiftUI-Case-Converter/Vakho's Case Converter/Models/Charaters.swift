//
//  Characters.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/15/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Characters
struct Characters {
    private init() {}
}

// MARK:- Delimiters
extension Characters {
    enum Delimiters: CaseIterable {
        case standard, spaced
        
        var characters: [String] {
            switch self {
            case .standard: return ["(", ")", "[", "]", "{", "}", "|", "?", "!", ";", ":", "\u{2013}", "\u{2014}"]
            case .spaced: return ["-"] + Delimiters.standard.characters
            }
        }
        
        static let list: String = "( ) [ ] { } | ? ! ; : - \u{2013} \u{2014}"
    }
}

// MARK:- Full Stop
extension Characters {
    struct FullStop {
        static let character: Character = "."
        static let space: Character = " "
        
        static let characterWithSpace: String = ". "
        
        private init() {}
    }
}
