//
//  WordsEditView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 8/30/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Word Edit View
struct WordEditView: View {
    // MARK: Properties
    @State private var word: String = ""
    private var words: Set<String>
    
    private let addHandler: ((String) -> Void)?
    private let deleteHandler: ((String) -> Void)?
    
    // MARK: Initializers
    init(
        words: Set<String>,
        didAdd addHandler: ((String) -> Void)? = nil, didDelete deleteHandler: ((String) -> Void)? = nil
    ) {
        self.words = words
        
        self.addHandler = addHandler
        self.deleteHandler = deleteHandler
    }
}

// MARK:- Body
extension WordEditView {
    var body: some View {
        SectionView(content: {
            addField
            
            List(content: {
                ForEach(words.sorted(), id: \.self, content: { word in
                    row(word: word)
                })
                    .mask(Rectangle().cornerRadius(10))
            })
        })
    }
    
    private var addField: some View {
        HStack(spacing: 10, content: {
            TextField("", text: $word)
                .mask(Rectangle().cornerRadius(7))
            
            Button("Add", action: { add() })
                .disabled(word.count < 2)
                
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
            
                .font(.caption)
                .foregroundColor(Color.green.opacity(0.75))
        })
    }
    
    private func row(word: String) -> some View {
        ZStack(alignment: .leading, content: {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.formBackground)

            HStack(content: {
                Text(word)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                
                Button("Remove", action: { deleteHandler?(word) })
                    .buttonStyle(PlainButtonStyle())
                
                    .font(.caption)
                    .foregroundColor(Color.red.opacity(0.75))
            })
                .padding(.horizontal, 20)
        })
            .frame(height: CustomWordsView.Layout.row.height)
    }
}

// MARK:- Modification
private extension WordEditView {
    func add() {
        guard !word.isEmpty else { return }
        guard word.count >= 2 else { return }
        
        addHandler?(word)
        
        word = ""
    }
}

// MARK:- Preview
struct WordEditView_Previews: PreviewProvider {
    static var previews: some View {
        WordEditView(words: ["Abc", "Def", "Ghi"])
            .frame(width: MainView.Layout.view.width / 2)
    }
}

