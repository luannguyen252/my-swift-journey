//
//  Texts.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Password Type
extension PasswordType {
    var title: String {
        switch self {
        case .randomized: return "Randomized"
        case .verbal: return "Verbal"
        }
    }
}

// MARK:- CharacterPool
extension CharacterSet {
    var title: String {
        switch self {
        case .lowercase: return "Lowercase letters"
        case .uppercase: return "Uppercase letters"
        case .digits: return "Digits"
        case .symbols: return "Symbols"
        case .ambiguous: return "Ambiguous symbols"
        }
    }
    
    var details: String {
        switch self {
        case .lowercase: return "a – z"
        case .uppercase: return "A – Z"
        case .digits: return "0 – 9"
        case .symbols: return "! @ # $ % ^ & * ( )"
        case .ambiguous: return "~ - _ = + [ ] { } \\ | ; : ' \" , . < > / ?"
        }
    }
}

// MARK:- Additional Setting
extension AdditionalSetting {
    var title: String {
        switch self {
        case .startsWithLetter: return "Starts with a letter"
        case .similarCharacterPool: return "Similar-looking characters"
        case .consecutiveCharacterPool: return "Consecutive characters"
        case .pairedDuplicateCharacterPool: return "Paired duplicate characters"
        }
    }
    
    var details: String {
        switch self {
        case .startsWithLetter: return "Password always starts with a letter"
        case .similarCharacterPool: return "Password includes simiar looking characters, such as \"0\" and \"O\""
        case .consecutiveCharacterPool: return "Password contains guessable sequences, such as \"qwerty\""
        case .pairedDuplicateCharacterPool: return "Password includes predictabe sequences, such as \"aaaa\""
        }
    }
}

// MARK:- Readability
extension Readability {
    var title: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        case .custom: return "Custom"
        }
    }
}
