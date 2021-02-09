//
//  WordsGridView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/13/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Words Grid View
struct WordsGridView: View {
    // MARK: Properties
    private let title: String?
    
    private let words: [String]
    @State private var addedWords: Set<String>
    
    // MARK: Initializers
    init(title: String? = nil, words: [String]) {
        self.title = title
        
        self.words = words
        self._addedWords = .init(initialValue: .init(words))
    }
}

// MARK:- Body
extension WordsGridView {
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            if title != nil { Text(title ?? "") }
            
            Text(words.filter { addedWords.contains($0) }.joined(separator: ", "))
                .font(.caption)
                .foregroundColor(.secondary)
        })
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: Previews
struct WordsGridView_Previews: PreviewProvider {
    static var previews: some View {
        WordsGridView(title: "Title", words: (1...10).map { "Element \($0)" })
            .frame(size: MainView.Layout.view)
    }
}
