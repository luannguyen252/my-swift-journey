//
//  CaseConverter.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/18/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Case Converter
final class CaseConverter {
    // MARK: Initializers
    private init() {}
}

// MARK:- Lowercase
extension CaseConverter {
    static func toLowercase(_ phrase: String) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = phrase.lowercased()
        
        return phrase
    }
}

// MARK:- Uppercase
extension CaseConverter {
    static func toUppercase(_ phrase: String) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = phrase.uppercased()
        
        return phrase
    }
}

// MARK:- Title Case
extension CaseConverter {
    static func toTitleCase(_ phrase: String, settings: SettingsViewModel.TitleCaseSettings) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = phrase.lowercased()
        phrase = convertPrincipalWords(phrase, principalWords: settings.principalWords)
        phrase = convertSpecialWords(phrase, specialWords: settings.specialWords, pool: settings.specialWordsPool)
        phrase = convertDelimitered(phrase, capitalizeDelimetered: settings.capitalizeDelimetered)
        phrase = convertFirstAndLast(phrase)
        phrase = convertCustomWords(phrase, useCustomWords: settings.useCustomWords)
        
        return phrase
    }

    private static func convertPrincipalWords(_ phrase: String, principalWords: WordGroup) -> String {
        guard principalWords.ticked else { return phrase }

        let tokens: [String] = Tokenizer.tokenizeWords(phrase)

        var phrase = ""
        for token in tokens {
            if
                token.first?.isUppercasable ?? false &&
                token.count >= principalWords.length
            {
                phrase.append(token.capitalized)
            } else {
                phrase.append(token.lowercased())
            }
        }

        return phrase
    }
    
    private static func convertSpecialWords(_ phrase: String, specialWords: WordGroup, pool: Set<SpecialWord>) -> String {
        guard specialWords.ticked else { return phrase }

        var tokens: [String] = Tokenizer.tokenizeWords(phrase)
        let specialWords: Dictionary<Int, [String]> = SpecialWords.shared.retrieveWords(length: specialWords.length, pool: pool)

        for (length, specialWordsByLength) in specialWords {
            for specialWord in specialWordsByLength {
                for i in 0..<tokens.count {
                    var wordsLeftToCheck = length
                    let words: [String] = specialWord.components(separatedBy: .whitespaces)
                    
                    while wordsLeftToCheck > 0 {
                        let indexInToken: Int = i + (length - wordsLeftToCheck) * 2
                        let indexInWords: Int = length - wordsLeftToCheck
                        guard words.element(at: indexInWords) == tokens.element(at: indexInToken)?.lowercased() else { break }

                        wordsLeftToCheck -= 1
                        
                        if wordsLeftToCheck == 0 {
                            (i...i+length)
                                .filter { (0..<tokens.count).contains($0) }
                                .forEach { tokens[$0] = tokens[$0].lowercased() }
                        }
                    }
                }
            }
        }

        return tokens.joined()
    }
    
    private static func convertDelimitered(_ phrase: String, capitalizeDelimetered: Bool) -> String {
        guard capitalizeDelimetered else { return phrase }
        var phrase = phrase
        
        for delimiter in Characters.Delimiters.allCases {
            let delimiters: [String] = {
                switch delimiter {
                case .standard: return Characters.Delimiters.standard.characters
                case .spaced: return Characters.Delimiters.spaced.characters.map { " " + $0 + " " }
                }
            }()
            
            var tokens: [String] = {
                switch delimiter {
                case .standard: return Tokenizer.tokenizeDelimitered(phrase)
                case .spaced: return Tokenizer.tokenizeDelimiteredSpaced(phrase)
                }
            }()

            for (i, token) in tokens.enumerated() {
                guard delimiters.contains(token) else { continue }

                if let previousToken = tokens.element(at: i-1) {
                    var prevSubtokens: [String] = Tokenizer.tokenizePseudoWords(previousToken)

                    if prevSubtokens.count >= 2 {
                        let last: String = prevSubtokens.removeLast().capitalized
                        tokens[i-1] = prevSubtokens.joined() + last
                    } else {
                        tokens[i-1] = tokens[i-1].capitalized
                    }
                }

                if let nextToken = tokens.element(at: i+1) {
                    var nextSubtokens: [String] = Tokenizer.tokenizePseudoWords(nextToken)

                    if nextSubtokens.count >= 2 {
                        let first: String = nextSubtokens.removeFirst().capitalized
                        tokens[i+1] = first + nextSubtokens.joined()
                    } else {
                        tokens[i+1] = tokens[i+1].capitalized
                    }
                }
            }
            
            phrase = tokens.joined()
        }
        
        return phrase
    }
    
    private static func convertCustomWords(_ phrase: String, useCustomWords: Bool) -> String {
        guard useCustomWords else { return phrase }
        
        var tokens: [String] = Tokenizer.tokenizeWords(phrase)
        let customWords: Set<String> = Word.fetch().wordsSet
        
        for (i, token) in tokens.enumerated() {
            guard token != " " else { continue } // No word is allowed to contain a whitespace, but just in case
            
            for customWord in customWords {
                if token.lowercased() == customWord.lowercased() {
                    tokens[i] = customWord
                }
            }
        }
        
        return tokens.joined()
    }
    
    private static func convertFirstAndLast(_ phrase: String) -> String {
        var tokens: [String] = Tokenizer.tokenizeSentences(phrase)
        
        for (i, token) in tokens.enumerated() {
            var subtokens: [String] = Tokenizer.tokenizePseudoWords(token)
            
            if subtokens.count >= 3 {
                let first: String = subtokens.removeFirst().capitalized
                let last: String = subtokens.removeLast().capitalized
                
                tokens[i] = first + subtokens.joined() + last
            } else {
                tokens[i] = tokens[i].capitalized
            }
        }
        
        return tokens.joined()
    }
}

// MARK:- Sentence Case
extension CaseConverter {
    static func toSentenceCase(_ phrase: String) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = toSentenceCaseHelper(phrase)
        
        return phrase
    }
    
    static private func toSentenceCaseHelper(_ phrase: String) -> String {
        return phrase
            .components(separatedBy: ". ")
            .filter { !$0.isEmpty }.map { $0.first!.uppercased() + $0.dropFirst().lowercased() }
            .joined(separator: ". ")
    }
}

// MARK:- Capital Case
extension CaseConverter {
    static func toCapitalCase(_ phrase: String) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = toCapitalCaseHelper(phrase)
        
        return phrase
    }
    
    private static func toCapitalCaseHelper(_ phrase: String) -> String {
        var phrase = phrase
        
        var nextShouldBeConverted: Bool = true
        for (i, char) in phrase.enumerated() {
            if char.isNotUppercasable {
                nextShouldBeConverted = true
            } else if nextShouldBeConverted {
                phrase.replacing(at: i, with: char.uppercased())
                nextShouldBeConverted = false
            } else {
                phrase.replacing(at: i, with: char.lowercased())
            }
        }
        
        return phrase
    }
}

// MARK:- Alterante Case
extension CaseConverter {
    static func toAlternateCase(_ phrase: String) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = toAlternateCaseHelper(phrase)
        
        return phrase
    }
    
    static private func toAlternateCaseHelper(_ phrase: String) -> String {
        var phrase = phrase
        
        for (i, char) in phrase.enumerated() {
            let shouldBeLowercased: Bool = i % 2 == 0
            phrase.replacing(at: i, with: shouldBeLowercased ? char.lowercased() : char.uppercased())
        }
        
        return phrase
    }
}

// MARK:- Toggle Case
extension CaseConverter {
    static func toToggleCase(_ phrase: String) -> String {
        var phrase = phrase.fixedSpacing()
        
        phrase = toToggleCaseHelper(phrase)
        
        return phrase
    }
    
    static private func toToggleCaseHelper(_ phrase: String) -> String {
        var phrase = phrase
        
        for (i, char) in phrase.enumerated() {
            phrase.replacing(at: i, with: char.isLowercase ? char.uppercased() : char.lowercased())
        }
        
        return phrase
    }
}

// MARK:- Helpers - Subscript
private extension String {
    subscript(_ i: Int) -> Character {
        assert(i >= 0 && i < self.count, "Index Out of Range")
        return self[.init(utf16Offset: i, in: self)]
    }

    func replaced(at i: Int, with char: String) -> String {
        assert(i >= 0 && i < self.count, "Index Out of Range")
        return .init(prefix(i)) + char + String(dropFirst(i + 1))
    }

    mutating func replacing(at i: Int, with char: String) -> Void {
        self = replaced(at: i, with: char)
    }
}

// MARK:- Helpers - Spacing
private extension String {
    func fixedSpacing() -> String {
        var str = self

        while str.first == " " { _ = str.removeFirst() }

        return self
            .components(separatedBy: .whitespaces)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }

    mutating func fixSpacing() {
        self = fixedSpacing()
    }
}
