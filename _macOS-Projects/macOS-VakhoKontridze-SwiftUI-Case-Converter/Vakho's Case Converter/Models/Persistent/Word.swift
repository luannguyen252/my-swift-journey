//
//  Word.swift
//  Vakho's Case Converter
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
    
    // MARK: Initializers
    private convenience init?(_ word: String) {
        guard !word.contains(" ") else { return nil }
        
        self.init(entity: Word.entity(), insertInto: appDelegate.moc)

        self.word = word
        
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
    var wordsSet: Set<String> { Array(self).wordsSet }
}

extension Array where Element == Word {
    var wordsSet: Set<String> { .init(self.compactMap { $0.word }) }
}

// MARK:- Modification
extension Word {
    static func create(_ word: String) {
        guard !fetch().contains(where: { $0.word == word }) else { return }
        let _: Word? = Word(word)
    }
    
    static func delete(_ word: String) {
        guard let word = fetch().first(where: { $0.word == word }) else { return }
        appDelegate.moc.delete(word)
        
        try? appDelegate.moc.save()
    }
}
