//
//  Word.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/31/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftUI

// MARK:- Word
@objc(Word) public class Word: NSManagedObject {
    // MARK: Properties
    @NSManaged public var word: String?
    @NSManaged public var isAdded: Bool
    @NSManaged public var isExcluded: Bool
    
    // MARK: Initializers
    private convenience init(_ word: String, isAdded: Bool) {
        self.init(entity: Word.entity(), insertInto: appDelegate.moc)

        self.word = word
        self.isAdded = isAdded
        self.isExcluded = !isAdded
        
        try? appDelegate.moc.save()
    }
}

// MARK:- Fetch
extension Word {
    static var fetchRequest: NSFetchRequest<Word> {
        let fetchRequst: NSFetchRequest<Word> = .init(entityName: "Word")
        fetchRequst.sortDescriptors = [NSSortDescriptor(keyPath: \Word.word, ascending: true)]

        return fetchRequst
    }
    
    static func fetch() -> [Word] {
        (try? appDelegate.moc.fetch(fetchRequest)) ?? []
    }
}

extension FetchedResults where Result == Word {
    var addedWords: Set<String> { Array(self).addedWords }
    var excludedWords: Set<String> { Array(self).excludedWords }
}

extension Array where Element == Word {
    var addedWords: Set<String> { .init(filter { $0.isAdded }.compactMap { $0.word }) }
    var excludedWords: Set<String> { .init(filter { $0.isExcluded }.compactMap { $0.word }) }
}

// MARK:- Modification
extension Word {
    static func create(_ word: String, isAdded: Bool) {
        if let existingWord = fetch().first(where: { $0.word == word }) {
            existingWord.isAdded = isAdded
            existingWord.isExcluded = !isAdded
            
            try? appDelegate.moc.save()
        } else {
            let _: Word = .init(word, isAdded: isAdded)
        }
    }
    
    static func delete(_ word: String) {
        guard let word = fetch().first(where: { $0.word == word }) else { return }
        appDelegate.moc.delete(word)
        
        try? appDelegate.moc.save()
    }
}
