//
//  Numbering.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 25.09.20.
//

import Foundation

// MARK:- Numbering
struct Numbering {
    var isOn: Bool
    var style: Style
    var separator: String
}

// MARK:- Numbering Style
extension Numbering {
    enum Style: Int, Identifiable, CaseIterable {
        // MARK: Cases
        case cardinal
        case cardinalReversed
        
        case cardinalVerbose
        case cardinalVerboseCapitalized
        case cardinalVerboseReversed
        case cardinalVerboseReversedCapitalized
        
        case ordinal
        case ordinalReversed
        
    //    case ordinalVerbose
    //    case ordinalVerboseCaptialized
    //    case ordinalVerboseReversed
    //    case ordinalVerboseReversedCaptialized

        case alphabetic
        case alphabeticUppercased
        case alphabeticReversed
        case alphabeticReversedUppercased
        
        case roman
        case romanUppercased
        case romanReversed
        case romanReversedUppercased
        
        // MARK: Proeprties
        var id: Int { rawValue }
        
        var title: String {
            switch self {
            case .cardinal: return "cardinal"
            case .cardinalReversed: return "cardinal (reversed)"
            
            case .cardinalVerbose: return "cardinal verbose"
            case .cardinalVerboseCapitalized: return "cardinal verbose (capitalized)"
            case .cardinalVerboseReversed: return "cardinal verbose (reversed)"
            case .cardinalVerboseReversedCapitalized: return "cardinal verbose (reversed, capitalized)"
            
            case .ordinal: return "ordinal"
            case .ordinalReversed: return "ordinal (reversed)"
                
            case .alphabetic: return "alphabetic"
            case .alphabeticUppercased: return "alphabetic (uppercased)"
            case .alphabeticReversed: return "alphabetic (reversed)"
            case .alphabeticReversedUppercased: return "alphabetic (reversed, uppercased)"
            
            case .roman: return "roman"
            case .romanUppercased: return "roman (uppercased)"
            case .romanReversed: return "roman (reversed)"
            case .romanReversedUppercased: return "roman (reversed, uppercased)"
            }
        }
        
        var shouldBeFollowedByDivider: Bool {
            [
                .cardinalReversed,
                .cardinalVerboseReversedCapitalized,
                .ordinalReversed,
                .alphabeticReversedUppercased
            ].contains(self)
        }
    }
}
