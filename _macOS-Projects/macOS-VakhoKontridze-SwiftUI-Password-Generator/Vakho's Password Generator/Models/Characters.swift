//
//  Characters.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Characters
struct Characters: Hashable {
    // MARK: Properties
    let set: CharacterSet
    
    var isIncluded: Bool
    
    var quantity: Int       // Not utilized until RandomPasswordGenerator exeuctes generate()
    
    var weight: Int
    static let weightRange: ClosedRange<Int> = 0...100

    // MARK: Initializers
    init(set: CharacterSet, isIncluded: Bool) {
        self.set = set
        self.isIncluded = isIncluded
        self.quantity = 0
        self.weight = set.standardWeight(readability: .defaultCase)
    }
}

// MARK:- Character Set
enum CharacterSet: Int, CaseIterable, Identifiable {
    case lowercase, uppercase, digits, symbols, ambiguous

    var id: Int { rawValue }
    
    var firstCharacter: Character {
        switch self {
        case .lowercase: return "a"
        case .uppercase: return "A"
        case .digits: return "2"
        case .symbols: return "!"
        case .ambiguous: return "`"
        }
    }

    func characters(includesSimilar: Bool = true) -> String {
        switch (self, includesSimilar) {
        case (.lowercase, false): return "acdefhijkmnoprstuvwxyz"
        case (.lowercase, true): return "abcdefghijklmnopqrstuvwxyz"
        
        case (.uppercase, false): return "ABCDEFHJKLMNPQRUVWXYZ"
        case (.uppercase, true): return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
       
        case (.digits, false): return "2348"
        case (.digits, true): return "0123456789"
        
        case (.symbols, _): return "!@#$%^&*()"
        
        case (.ambiguous, _): return "`~-_=+[]{}\\|;:'\",.<>/?"
        }
    }
    
    
    static var consecutiveInAlphabet: String = "abcdefghijklmnopqrstuvwxyz"
    static var consecutiveInNumbers: String = "0123456789"
    static var consecutiveOnKeyboard: [String] = [
        "1q", "qa", "az",
        "2w", "ws", "sx",
        "3e", "ed", "dc",
        "4r", "rf", "fv",
        "5t", "tg", "gb",
        "6y", "yh", "hn",
        "7u", "uj", "jm",
        "8i", "ik", "ol",
        "9o",
        "0p",

        "qw", "we", "er", "rt", "ty", "yu", "ui", "io", "op",
        "as", "sd", "df", "fg", "gh", "hj", "jk", "kl",
        "zx", "xc", "cv", "vb", "bn", "nm"
    ]

    func standardWeight(readability: Readability) -> Int {
        switch (readability, self) {
        case (.low, .lowercase): return 50
        case (.low, .uppercase): return 35
        case (.low, .digits): return 15
        case (.low, .symbols): return 9
        case (.low, .ambiguous): return 3

        case (.medium, .lowercase): return 75
        case (.medium, .uppercase): return 25
        case (.medium, .digits): return 10
        case (.medium, .symbols): return 6
        case (.medium, .ambiguous): return 2

        case (.high, .lowercase): return 100
        case (.high, .uppercase): return 15
        case (.high, .digits): return 5
        case (.high, .symbols): return 3
        case (.high, .ambiguous): return 1
            
        case (.custom, _): return standardWeight(readability: .defaultCase)
        }
    }
}
