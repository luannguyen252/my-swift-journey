//
//  NaturalComparator.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 25.09.20.
//

import Cocoa

// MARK:- Extensions
extension String {
    static func naturalSortOrder(lhs: String, rhs: String) -> Bool {
        NaturalComparator.compare(lhs: lhs, rhs: rhs)
    }
}

// MARK:- Natural Comparator
final class NaturalComparator {
    private init() {}
}

// MARK:- Sort
extension NaturalComparator {
    static func sort(_ text: String, settings: SettingsViewModel.NaturalComparisonSettings) -> String {
        var lines: [String] = text.components(separatedBy: .newlines)
        
        if settings.removeDuplicates { lines.removingDuplicates() }
        lines = fixSpacing(lines, fixSpacing: settings.fixSpacing)
        lines.sort(by: String.naturalSortOrder)
        lines = Numerator.enumerate(lines, numbering: settings.numbering)
        
        return lines.joined(separator: "\n")
    }
}

// MARK:- Spacing
private extension NaturalComparator {
    static func fixSpacing(_ lines: [String], fixSpacing: Bool) -> [String] {
        guard fixSpacing else { return lines }
        
        return lines.map {
            $0
                .components(separatedBy: .whitespaces)
                .filter { !$0.isEmpty }
                .joined(separator: " ")
        }
    }
}

// MARK:- Sort Order
private extension NaturalComparator {
    static func compare(lhs: String, rhs: String) -> Bool {
        let (lhs, rhs): ([String], [String]) = {
            var (lhs, rhs) = (lhs, rhs)
            ommitIdenticalCharacters(lhs: &lhs, rhs: &rhs)
            let (tokens): ([String], [String]) = (lhs.tokens, rhs.tokens)
            return tokens
        }()
        
        let length: Int = Swift.min(lhs.count, rhs.count)
        
        for i in 0..<length {
            guard lhs[i] != rhs[i] else { continue }

            switch (lhs[i].first?.characterType, rhs[i].first?.characterType) {
                case (.whiteSpace, .whiteSpace): continue
                case (.whiteSpace, .number): return true
                case (.whiteSpace, .letter): return true
                case (.whiteSpace, .punctuation): return true
                case (.whiteSpace, .other): return true
                    
                case (.number, .whiteSpace): return false
                case (.number, .number): return Int(lhs[i])! < Int(rhs[i])!
                case (.number, .punctuation): return true
                case (.number, .letter): return true
                case (.number, .other): return true

                case (.letter, .whiteSpace): return false
                case (.letter, .number): return false
                case (.letter, .letter): return lhs[i].lowercased() < rhs[i].lowercased()
                case (.letter, .punctuation): return true
                case (.letter, .other): return true
                    
                case (.punctuation, .whiteSpace): return false
                case (.punctuation, .number): return false
                case (.punctuation, .letter): return false
                case (.punctuation, .punctuation): return lhs[i] < rhs[i]
                case (.punctuation, .other): return false

                case (.other, .whiteSpace): return false
                case (.other, .punctuation): return false
                case (.other, .number): return false
                case (.other, .letter): return false
                case (.other, .other): return lhs[i] < rhs[i]
                    
                default: return lhs[i] < rhs[i]    // Nil type
            }
        }
        
        return lhs.count < rhs.count
    }

    static func ommitIdenticalCharacters(lhs: inout String, rhs: inout String) {
        // This algorithm also allows for furhter tokenization of string, when lhs and rhs contain similar sequences:
        // NeedsASort X-> ["NeedsASort"]           -> ["A"]
        // Needs-Sort X-> ["Needs", "-". "Sort"]   -> ["-"]
        
        var length: Int = Swift.min(lhs.count, rhs.count)
        var i: Int = 0
        
        while true {
            guard i != length else { break }
            
            if lhs[i] == rhs[i] {
                lhs.remove(at: .init(utf16Offset: i, in: lhs))
                rhs.remove(at: .init(utf16Offset: i, in: rhs))
                length -= 1
            } else {
                i += 1
            }
        }
    }
}

private extension String {
    var tokens: [String] {
        guard count >= 1 else { return [] }
        
        var tokens: [String] = []
        
        for (i, char) in enumerated() {
            if tokens.isEmpty || char.characterType != self[i-1].characterType {
                tokens.append(.init(char))
            } else {
                tokens[tokens.count-1].append(char)
            }
        }
        
        return tokens
    }
}

// MARK:- Character Types
private enum CharacterType: CaseIterable {
    case whiteSpace
    case number
    case letter
    case punctuation
    case other
    
    var characterSet: CharacterSet? {
        switch self {
        case .whiteSpace: return .whitespaces
        case .number: return .decimalDigits
        case .letter: return .letters
        case .punctuation: return CharacterSet.punctuationCharacters.union(.symbols)
        case .other: return nil
        }
    }
    
    static func type(of str: Character) -> CharacterType {
        guard let scalar = str.unicodeScalars.first else { return .other }
        
        for type in allCases {
            if let characterSet = type.characterSet, characterSet.contains(scalar) {
                return type
            }
        }
        
        return .other
    }
}

private extension Character {
    var characterType: CharacterType {
        CharacterType.type(of: self)
    }
}

// MARK:- Helpers
private extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        // This algorithm is needed, because order must not be lost when convering to set and then to array
        var result: [Element] = []

        for element in self {
            if !result.contains(element) { result.append(element) }
        }

        return result
    }
    
    mutating func removingDuplicates() {
        self = self.removeDuplicates()
    }
}
