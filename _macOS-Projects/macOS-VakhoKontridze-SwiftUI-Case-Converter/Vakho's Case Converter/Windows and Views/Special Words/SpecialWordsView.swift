//
//  SpecialWordsView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/13/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Special Words View
struct SpecialWordsView: View {}

// MARK:- Body
extension SpecialWordsView {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(spacing: 10, content: {
                SectionView(title: "Articles", content: {
                    WordsGridView(words: SpecialWords.shared.articles)
                })
                
                SectionView(title: "Prepositions (Prototypical)", content: {
                    VStack(spacing: 15, content: {
                        WordsGridView(title: "Standard", words: SpecialWords.shared.prepositions.prototypical.standard)
                        WordsGridView(title: "Alternative", words: SpecialWords.shared.prepositions.prototypical.alternative)
                        WordsGridView(title: "Contextual (Standard)", words: SpecialWords.shared.prepositions.prototypical.contextual.standard)
                        WordsGridView(title: "Contextual (Alternative)", words: SpecialWords.shared.prepositions.prototypical.contextual.alternative)
                    })
                        .padding(.top, 15)
                })
                
                SectionView(title: "Prepositions (Intransitive)", content: {
                    VStack(spacing: 15, content: {
                        WordsGridView(title: "Standard", words: SpecialWords.shared.prepositions.intransitive.standard)
                        WordsGridView(title: "Alternative", words: SpecialWords.shared.prepositions.intransitive.alternative)
                        WordsGridView(title: "Contextual (Standard)", words: SpecialWords.shared.prepositions.intransitive.contextual.standard)
                        WordsGridView(title: "Contextual (Alternative)", words: SpecialWords.shared.prepositions.intransitive.contextual.alternative)
                    })
                        .padding(.top, 15)
                })
                
                SectionView(title: "Prepositions (Post)", content: {
                    VStack(spacing: 15, content: {
                        WordsGridView(title: "Standard", words: SpecialWords.shared.prepositions.postpositions.standard)
                        WordsGridView(title: "Alternative", words: SpecialWords.shared.prepositions.postpositions.alternative)
                        WordsGridView(title: "Contextual", words: SpecialWords.shared.prepositions.postpositions.contextual)
                    })
                        .padding(.top, 15)
                })
                
                SectionView(title: "Prepositions (Complex)", content: {
                    VStack(spacing: 15, content: {
                        WordsGridView(title: "Preposition + Preposition (Standard)", words: SpecialWords.shared.prepositions.complex.prepositionPreposition.standard)
                        WordsGridView(title: "Preposition + Preposition (Alternative)", words: SpecialWords.shared.prepositions.complex.prepositionPreposition.alternative)
                        WordsGridView(title: "Preposition + Noun + Preposition", words: SpecialWords.shared.prepositions.complex.prepositionNounPreposition)
                        WordsGridView(title: "Presposition + Article + Noun + Preposition", words: SpecialWords.shared.prepositions.complex.prepositionArticleNounPreposition)
                        WordsGridView(title: "Misc", words: SpecialWords.shared.prepositions.complex.misc)
                    })
                        .padding(.top, 15)
                })
                
                SectionView(title: "Conjunctions (Coordinating)", content: {
                    VStack(spacing: 15, content: {
                        WordsGridView(words: SpecialWords.shared.conjunctions.coordinating)
                    })
                        .padding(.top, 15)
                })
                
                SectionView(title: "Conjunctions (Subordianting)", content: {
                    VStack(spacing: 15, content: {
                        WordsGridView(title: "Standard", words: SpecialWords.shared.conjunctions.subordinating.single.standard)
                        WordsGridView(title: "Contextual", words: SpecialWords.shared.conjunctions.subordinating.single.contextual)
                        WordsGridView(title: "Double", words: SpecialWords.shared.conjunctions.subordinating.double)
                        WordsGridView(title: "Triple", words: SpecialWords.shared.conjunctions.subordinating.triple)
                    })
                        .padding(.top, 15)
                })
            })
        })
            .padding(10)
            .frame(size: Layout.view, alignment: .top)
    }
}

// MARK:- Layout
extension SpecialWordsView {
    struct Layout {
        // MARK: Properties
        static let window: CGSize = .init(width: view.ideal.width, height: view.ideal.height + titleBar.height)
        static let titleBar: CGSize = .init(width: -1, height: 22)
        
        static let view: SizeConfiguration = .init(
            min: .init(width: 600, height: 600),
            ideal: .init(width: 600, height: 600),
            max: .init(width: CGFloat.infinity, height: CGFloat.infinity)
        )
        
        // MARK: Initializers
        private init() {}
    }
}

// MARK:- Preview
struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialWordsView()
    }
}
