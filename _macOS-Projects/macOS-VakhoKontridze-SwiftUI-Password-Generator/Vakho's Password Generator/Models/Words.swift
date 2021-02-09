//
//  Words.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/30/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Words
final class Words {
    // MARK: Propertes
    static let words3CharacterPool: Set<String> = retreiveWords(length: 3)
    static let words4CharacterPool: Set<String> = retreiveWords(length: 4)
    static let words5CharacterPool: Set<String> = retreiveWords(length: 5)
    static let words6CharacterPool: Set<String> = retreiveWords(length: 6)
    static let words7CharacterPool: Set<String> = retreiveWords(length: 7)
    static let words8CharacterPool: Set<String> = retreiveWords(length: 8)
    
    // MARK: Initializers
    private init() {}
}

// MARK:- Retreive
extension Words {
    static func retrieveWord(length: Int, union addedWords: Set<String>) -> String? {
        let wordsPool: Set<String>? = {
            switch length {
            case 3: return words3CharacterPool
            case 4: return words4CharacterPool
            case 5: return words5CharacterPool
            case 6: return words6CharacterPool
            case 7: return words7CharacterPool
            case 8: return words8CharacterPool
            default: return nil
            }
        }()
        
        return wordsPool?.union(addedWords).randomElement()
    }
}

// MARK:- Decode
private extension Words {
    static func retreiveWords(length: Int) -> Set<String> {
        guard
            let url = Bundle.main.url(forResource: "Words\(length)Characters", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let words = json as? [String]
        else {
            return []
        }

        return .init(words)
    }
}
