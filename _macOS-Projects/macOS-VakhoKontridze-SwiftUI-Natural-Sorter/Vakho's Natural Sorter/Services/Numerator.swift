//
//  Numerator.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 26.09.20.
//

import Foundation

// MARK:- Numerator
final class Numerator {
    // MARK: Properties
    static private let cardinalVerboseFormatter: NumberFormatter = {
        let formatter: NumberFormatter = .init()
        formatter.numberStyle = .spellOut
        return formatter
    }()
    
    static private let ordinalVerboseFormatter: NumberFormatter = {
        let formatter: NumberFormatter = .init()
        formatter.numberStyle = .ordinal
        return formatter
    }()
    
    static private let alphabeticFormatter: AlphabeticFormatter = .init()
    
    static private let romanFormatter: RomanFormatter = .init()
    
    // MARK: Initializers
    private init() {}
}

// MARK:- Numbering
extension Numerator {
    static func enumerate(_ lines: [String], numbering: Numbering) -> [String] {
        guard numbering.isOn else { return lines }
        var lines = lines
        
        for (i, line) in lines.enumerated() {
            let enumeration: String = {
                switch numbering.style {
                case .cardinal: return .init(i + 1)
                case .cardinalReversed: return .init(lines.count - i)
                
                case .cardinalVerbose: return cardinalVerboseFormatter.string(from: .init(value: i + 1))!
                case .cardinalVerboseCapitalized: return cardinalVerboseFormatter.string(from: .init(value: i + 1))!.capitalized
                case .cardinalVerboseReversed: return cardinalVerboseFormatter.string(from: .init(value: lines.count - i))!
                case .cardinalVerboseReversedCapitalized: return cardinalVerboseFormatter.string(from: .init(value: lines.count - i))!.capitalized
                
                case .ordinal: return ordinalVerboseFormatter.string(from: .init(value: i + 1))!
                case .ordinalReversed: return ordinalVerboseFormatter.string(from: .init(value: lines.count - i))!
                
                case .alphabetic: return alphabeticFormatter.string(from: i + 1)!
                case .alphabeticUppercased: return alphabeticFormatter.string(from: i + 1)!.uppercased()
                case .alphabeticReversed: return alphabeticFormatter.string(from: lines.count - i)!
                case .alphabeticReversedUppercased: return alphabeticFormatter.string(from: lines.count - i)!.uppercased()
                
                case .roman: return romanFormatter.string(from: i + 1)!
                case .romanUppercased: return romanFormatter.string(from: i + 1)!.uppercased()
                case .romanReversed: return romanFormatter.string(from: lines.count - i)!
                case .romanReversedUppercased: return romanFormatter.string(from: lines.count - i)!.uppercased()
                }
            }()
            
            lines[i] = enumeration + numbering.separator + line
        }
        
        return lines
    }
}

// MARK:- Alphabetic Formatter
private final class AlphabeticFormatter {
    // MARK: Properties
    private let letters: String = "abcdefghijklmnopqrstuvwxyz"
    
    // MARK: Initializers
    fileprivate init() {}
}

private extension AlphabeticFormatter {
    func string(from number: Int) -> String? {
        guard number > 0 else { return nil }

        let remainders: [Int] = {
            var number = number

            var remainders: [Int] = []
            while number > 0 {
                remainders.append(number % 26)
                number = number / 26
            }
            remainders = remainders.filter { $0 != 0 }
            remainders.reverse()
            
            return remainders
        }()
        
        let numbering: String = remainders
            .map { .init(letters[$0 - 1]) }
            .joined()
        
        return numbering
    }
}

// MARK:- Roman Formatter
private final class RomanFormatter {
    // MARK: Properties
    private let numeralsAndRomans: [NumeralRomanPair] = [
        .init(1000, "m"),
        .init(900, "cm"),
        .init(500, "d"),
        .init(400, "cd"),
        .init(100, "c"),
        .init(90, "xc"),
        .init(50, "l"),
        .init(40, "xl"),
        .init(10, "x"),
        .init(9, "ix"),
        .init(5, "v"),
        .init(4, "iv"),
        .init(1, "i")
    ]
    
    struct NumeralRomanPair {
        let numeral: Int
        let roman: String
        
        init(_ numeral: Int, _ roman: String) {
            self.numeral = numeral
            self.roman = roman
        }
    }
    
    // MARK: Initializers
    fileprivate init() {}
}

private extension RomanFormatter {
    func string(from number: Int) -> String? {
        guard number > 0 else { return nil }
        var number = number
        
        var romanNumber: String = ""
        while number > 0 {
            for pair in numeralsAndRomans where number - pair.numeral >= 0 {
                number -= pair.numeral
                romanNumber += pair.roman
                break
            }
        }

        return romanNumber
    }
}
