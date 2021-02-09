//
//  ConversionCase.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/15/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- ConversionCase
enum ConversionCase: Int, CaseIterable, Identifiable {
    case lower, upper
    case title, sentence, capital
    case alternate, toggle
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .lower: return "Lowercase"
        case .upper: return "Uppercase"
        case .title: return "Title Case"
        case .sentence: return "Sentence Case"
        case .capital: return "Capital Case"
        case .alternate: return "Alternate Case"
        case .toggle: return "Toggle Case"
        }
    }
}

// MARK:- Next Case
extension ConversionCase {
    mutating func nextCase() {
        switch self {
        case .lower: self = .upper
        case .upper: self = .title
        case .title: self = .sentence
        case .sentence: self = .capital
        case .capital: self = .alternate
        case .alternate: self = .toggle
        case .toggle: self = .lower
        }
    }
}
