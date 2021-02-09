//
//  RandomPasswordGenerator.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Random Password Generator
final class RandomPasswordGenerator {
    // MARK: Properties
    private let length: Int
    private let lengthWithSeparator: Int
    
    private var passwordsLeftToGenerate: Int
    
    private var characters: [Characters]
    private let readability: Readability
    private let additionalSettings: Set<AdditionalSetting>
    private let separator: Separator
    
    // MARK: Initializers
    init(
        length: Int, lengthWithSeparator: Int, quantity: Int,
        characters: [Characters], readability: Readability, additionalSettings: Set<AdditionalSetting>, separator: Separator
    ) {
        self.length = length
        self.lengthWithSeparator = lengthWithSeparator
        
        self.passwordsLeftToGenerate = quantity
        
        self.characters = characters
        self.readability = readability
        self.additionalSettings = additionalSettings
        self.separator = separator
    }
}

// MARK:- Generate
extension RandomPasswordGenerator: PasswordGenerator {
    func generate(completion: (PasswordResult) -> Bool) {
        guard retrieveCharacterQuantities() else {
            _ = completion(.failure(.invalidConfiguration))
            return
        }
        
        var passwords: Set<String> = []
        while passwordsLeftToGenerate > 0 {
            guard
                let password = generate(),
                !passwords.contains(password)
            else {
                let shouldContinue: Bool = completion(.failure(.couldntGenerate))
                
                guard shouldContinue else { return }
                continue
            }
            
            passwords.insert(password)
            passwordsLeftToGenerate -= 1
            let shouldContinue: Bool = completion(.success(password))

            guard shouldContinue else { return }
        }
    }
    
    func generate() -> String? {
        var characters = self.characters    // Duplicates characters to prevent pernament chaning to the original model
        
        var password: String = ""
        retrieveFirstCharacter(from: &characters, writeIn: &password)
        guard retrieveRemainingCharacters(from: &characters, writeIn: &password) else { return nil }
        guard filter(&password) else { return nil }
        
        return password
    }
}

// MARK:- Character Quantitiess
private extension RandomPasswordGenerator {
    func retrieveCharacterQuantities() -> Bool {
        retreiveRawQuantities()
        guard retreiveQuantities() else { return false }
        
        return true
    }
    
    func retreiveRawQuantities() {
        let totalWeight: Int = characters.filter { $0.isIncluded && $0.weight > 0 }.map { $0.weight }.reduce(0, +)
        
        for (i, type) in characters.enumerated() {
            characters[i].quantity = {
                guard type.isIncluded && type.weight > 0 else { return 0 }
                
                let ratio: Double = Double(type.weight) / Double(totalWeight)
                let quantity: Double = Double(length) * ratio
                let weight: Int = .init(quantity.rounded())

                return weight
            }()
        }
    }
    
    func retreiveQuantities() -> Bool {
        var totalLength: Int { characters.map { $0.quantity }.reduce(0, +) }
        
        for _ in 1...(10 * length) {
            guard totalLength != length else { return true }
            
            var differenceExists: Bool { (length - totalLength) != 0 }
            var increment: Int { (length - totalLength) > 0 ? 1 : -1 }
            
            for (i, type) in characters.enumerated() {
                if differenceExists && (type.isIncluded && type.weight > 0 ) && type.quantity > 1 {  // Cannot be dropped to 0
                    characters[i].quantity += increment
                }
            }
            
            for (i, type) in characters.filter({ $0.isIncluded && $0.weight > 0 }).enumerated() {
                if type.quantity == 0 {
                    characters[i].quantity += 1
                }
            }
        }
        
        return false
    }
}

// MARK:- Retreive
private extension RandomPasswordGenerator {
    func retrieveFirstCharacter(from characters: inout [Characters], writeIn password: inout String) {
        guard additionalSettings.contains(.startsWithLetter) else { return }
        
        guard
            (characters.lowercase.isIncluded && characters.lowercase.weight > 0) ||
            (characters.uppercase.isIncluded && characters.uppercase.weight > 0)
        else {
            return
        }
        
        guard let characterSet: CharacterSet = [.lowercase, .uppercase].randomElement() else { return }
        guard let character = characterSet.characters(includesSimilar: additionalSettings.contains(.similarCharacterPool)).randomElement() else { return }
        
        switch characterSet {
        case .lowercase: characters.lowercase.quantity -= 1
        case .uppercase: characters.uppercase.quantity -= 1
        default: break
        }
        
        password.append(character)
    }
    
    func retrieveRemainingCharacters(from characters: inout [Characters], writeIn password: inout String) -> Bool {
        password += {
            var pool: String = ""
            
            for type in characters.filter({ $0.isIncluded && $0.weight > 0 }) {
                type.quantity.times { pool.append(self.retrieveRandomCharacter(from: type.set)) }
            }

            return String(pool.shuffled())
        }()
        
        if separator.isEnabled {
            let rawString: JoinedSequence<[[String.Element]]> = Array(password)
                .chunked(into: separator.characterChunkQuantity)
                .joined(separator: Separator.separator)
            
            password = .init(rawString)
        }
        
        guard password.count == length else { return false }
        
        return true
    }
    
    func retrieveRandomCharacter(from characterSet: CharacterSet) -> Character {
        characterSet.characters(includesSimilar: additionalSettings.contains(.similarCharacterPool)).randomElement() ?? characterSet.firstCharacter
    }
}

// MARK:- Filter
private extension RandomPasswordGenerator {
    func filter(_ password: inout String) -> Bool {
        let containDuplicate: Bool = additionalSettings.contains(.pairedDuplicateCharacterPool)
        let containConsecutive: Bool = additionalSettings.contains(.consecutiveCharacterPool)
        
        for _ in 1...(10 * length) {
            let indexOpt: Int? = {
                switch (containDuplicate, containConsecutive) {
                case (false, false): return findDuplicateIndex(in: password) ?? findConsecutiveIndex(in: password)
                case (false, true): return findDuplicateIndex(in: password)
                case (true, false): return findConsecutiveIndex(in: password)
                case (true, true): return nil
                }
            }()
            guard let index = indexOpt else { return true }
            
            guard let type = password[index].type else { return false }
            password.replace(at: index, with: retrieveRandomCharacter(from: type))
        }
        
        return false
    }
    
    func findDuplicateIndex(in password: String) -> Int? {
        for i in 0..<length-1 where password[i] == password[i+1] {
            if additionalSettings.contains(.startsWithLetter) && i == 0 {
                return i+1
            } else {
                return i
            }
        }
        
        return nil
    }
    
    func findConsecutiveIndex(in password: String) -> Int? {
        for i in 0..<length-1 {
            let containsDuplicate: Bool = {
                let sequence1: String = "\(password[i])\(password[i+1])".lowercased()
                let sequence2: String = "\(password[i+1])\(password[i])".lowercased()
                
                guard !CharacterSet.consecutiveInAlphabet.contains(sequence1) else { return true }
                guard !CharacterSet.consecutiveInAlphabet.contains(sequence2) else { return true }
                
                guard !CharacterSet.consecutiveInNumbers.contains(sequence1) else { return true }
                guard !CharacterSet.consecutiveInNumbers.contains(sequence2) else { return true }
                
                guard !CharacterSet.consecutiveOnKeyboard.contains(sequence1) else { return true }
                guard !CharacterSet.consecutiveOnKeyboard.contains(sequence2) else { return true }
                
                return false
            }()
            guard containsDuplicate else { continue }
            
            if additionalSettings.contains(.startsWithLetter) && i == 0 {
                return i+1
            } else {
                return i
            }
        }
        
        return nil
    }
}

// MARK:- Convenience
private extension Array where Element == Characters {
    var lowercase: Characters {
        get { self[0] }
        set { self[0] = newValue }
    }
    
    var uppercase: Characters {
        get { self[1] }
        set { self[1] = newValue }
    }
    
    var digits: Characters {
        get { self[2] }
        set { self[2] = newValue }
    }
    
    var symbols: Characters {
        get { self[3] }
        set { self[3] = newValue }
    }
    
    var ambiguous: Characters {
        get { self[4] }
        set { self[4] = newValue }
    }
}
