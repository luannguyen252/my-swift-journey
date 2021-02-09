//
//  SpecialWord.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/15/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Special Word
enum SpecialWord: Int, CaseIterable, Identifiable {
    case standard, alternative, contextual
    case double, triple, quadruple
    
    static var defaultValue: Set<SpecialWord> = [.standard, .double, .triple, .quadruple]
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .standard: return "Standard"
        case .alternative: return "Alternative"
        case .contextual: return "Contextual"
        case .double: return "Double-Word"
        case .triple: return "Triple-Word"
        case .quadruple: return "Quadruple-Word"
        }
    }
    
    var details: String {
        let base: String = "Articles, Prepositions, and Conjunctions"
        
        switch self {
        case .standard: return "Standard \(base)"
        case .alternative: return "Archaic, dialectal, or specialized forms of \(base)"
        case .contextual: return "\(base), mistaked for principals by algorithm"
        case .double: return "Compound \(base) with two words"
        case .triple: return "Compound \(base) with three words"
        case .quadruple: return "Compound \(base) with four words"
        }
    }
}
