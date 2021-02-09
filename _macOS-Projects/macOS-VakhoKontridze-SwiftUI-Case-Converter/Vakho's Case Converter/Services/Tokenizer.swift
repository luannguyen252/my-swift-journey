//
//  Tokenizer.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/20/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Tokenizer
final class Tokenizer {
    // MARK: Initializers
    private init() {}
}

// MARK:- Sentences
extension Tokenizer {
    static func tokenizeSentences(_ phrase: String) -> [String] {
        var tokens: [String] = group2(phrase, current: Characters.FullStop.character, next: Characters.FullStop.space) // Last dot is merged with last token
        
        if let last = tokens.last?.last, .init(last) == Characters.FullStop.character {
            _ = tokens[tokens.count-1].removeLast()
            tokens.append(.init(last))
        }
        
        return tokens
    }
}

// MARK:- Words
extension Tokenizer {
    static func tokenizePseudoWords(_ phrase: String) -> [String] {
        group1(phrase, current: " ")
    }
    
    static func tokenizeWords(_ phrase: String) -> [String] {
        var tokens: [String] = []

        for char in phrase {
            if tokens.isEmpty || char.isUppercasable != tokens.last?.first?.isUppercasable {
                tokens.append(.init(char))
            } else {
                tokens[tokens.count-1].append(char)
            }
        }

        return tokens
    }
}

// MARK:- Delimiters
extension Tokenizer {
    static func tokenizeDelimitered(_ phrase: String) -> [String] {
        group1(phrase, currentCondition: { Characters.Delimiters.standard.characters.contains(.init($0)) })
    }
    
    static func tokenizeDelimiteredSpaced(_ phrase: String) -> [String] {
        group3(phrase, previous: " ", currentCondition: { Characters.Delimiters.spaced.characters.contains(.init($0)) }, next: " ")
    }
}

// MARK:- Grouping (1)
private extension Tokenizer {
    static func group1(
        _ phrase: String,
        current: Character
    ) -> [String] {
        group1(phrase, currentCondition: { $0 == current })
    }
    
    static func group1(
        _ phrase: String,
        currentCondition: (Character) -> Bool
    ) -> [String] {
        var tokens: [String] = []
        
        for char in phrase {
            let isCurrent: Bool = currentCondition(char)
            
            if tokens.isEmpty {
                tokens.append(.init(char))
            } else if isCurrent {
                tokens.append(.init(char))
                tokens.append("")
            } else {
                tokens[tokens.count-1].append(char)
            }
        }
        
        return tokens
    }
}

// MARK:- Grouping (2)
private extension Tokenizer {
    static func group2(
        _ phrase: String,
        current: Character,
        next: Character
    ) -> [String] {
        group2(phrase, currentCondition: { $0 == current }, nextCondition: { $0 == next })
    }
    
    static func group2(
        _ phrase: String,
        currentCondition: (Character) -> Bool,
        nextCondition: (Character) -> Bool
    ) -> [String] {
        var tokens: [String] = []
        
        for (i, char) in phrase.enumerated() {
            let isCurrent: Bool = {
                guard let next = phrase.element(at: i+1) else { return false }
                return currentCondition(char) && nextCondition(next)
            }()
            let isNext: Bool = {
                guard let previous = phrase.element(at: i-1) else { return false }
                return currentCondition(previous) && nextCondition(char)
            }()
            
            if tokens.isEmpty || isCurrent {
                tokens.append(.init(char))
            } else if isNext {
                tokens[tokens.count-1].append(char)
                tokens.append("")
            } else {
                tokens[tokens.count-1].append(char)
            }
        }
        
        return tokens
    }
}

// MARK:- Grouping (3)
private extension Tokenizer {
    static func group3(
        _ phrase: String,
        previous: Character,
        current: Character,
        next: Character
    ) -> [String] {
        group3(phrase, previousCondition: { $0 == previous }, currentCondition: { $0 == current }, nextCondition: { $0 == next })
    }
    
    static func group3(
        _ phrase: String,
        previous: Character,
        currentCondition: (Character) -> Bool,
        next: Character
    ) -> [String] {
        group3(phrase, previousCondition: { $0 == previous }, currentCondition: currentCondition, nextCondition: { $0 == next })
    }
    
    static func group3(
        _ phrase: String,
        previousCondition: (Character) -> Bool,
        currentCondition: (Character) -> Bool,
        nextCondition: (Character) -> Bool
    ) -> [String] {
        var tokens: [String] = []
        
        for (i, char) in phrase.enumerated() {
            let isPrevious: Bool = {
                guard let next = phrase.element(at: i+1) else { return false }
                guard let nextNext = phrase.element(at: i+2) else { return false }
                return previousCondition(char) && currentCondition(next) && nextCondition(nextNext)
            }()
            let isCurrent: Bool = {
                guard let previous = phrase.element(at: i-1) else { return false }
                guard let next = phrase.element(at: i+1) else { return false }
                return previousCondition(previous) && currentCondition(char) && nextCondition(next)
            }()
            let isNext: Bool = {
                guard let previousPrevious = phrase.element(at: i-2) else { return false }
                guard let previous = phrase.element(at: i-1) else { return false }
                return previousCondition(previousPrevious) && currentCondition(previous) && nextCondition(char)
            }()
            
            if tokens.isEmpty || isPrevious {
                tokens.append(.init(char))
            } else if isCurrent {
                tokens[tokens.count-1].append(char)
            } else if isNext {
                tokens[tokens.count-1].append(char)
                tokens.append("")
            } else {
                tokens[tokens.count-1].append(char)
            }
        }
        
        return tokens
    }
}

// MARK:- Helpers -- Contains
private extension Collection {
    func containsOptional(_ element: Element?) -> Bool where Element: Equatable {
        guard let element = element else { return false }
        return contains(element)
    }
}

// MARK:- Helpers - Uppercasable
extension Character {
    var isUppercasable: Bool { isLetter || isNumber || self == "-" }
    var isNotUppercasable: Bool { !isUppercasable }
}
