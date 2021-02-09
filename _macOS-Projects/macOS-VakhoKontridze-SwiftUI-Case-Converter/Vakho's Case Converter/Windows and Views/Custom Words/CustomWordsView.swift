//
//  CustomWordsView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/21/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Custom Words View
struct CustomWordsView: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    
    @FetchRequest(fetchRequest: Word.fetchRequest) private var words: FetchedResults<Word>
}

// MARK:- Body
extension CustomWordsView {
    var body: some View {
        WordEditView(
            words: words.wordsSet,
            didAdd: { Word.create($0) },
            didDelete: { Word.delete($0) }
        )
            .padding(10)
            .frame(size: Layout.view, alignment: .top)
    }
}

// MARK:- Layout
extension CustomWordsView {
    struct Layout {
        // MARK: Properties
        static let window: CGSize = .init(width: view.ideal.width, height: view.ideal.height + titleBar.height)
        static let titleBar: CGSize = .init(width: -1, height: 22)
        
        static let view: SizeConfiguration = .init(
            min: .init(width: 600, height: 600),
            ideal: .init(width: 600, height: 600),
            max: .init(width: CGFloat.infinity, height: CGFloat.infinity)
        )
        
        static let row: CGSize = .init(width: -1, height: 30)
        
        // MARK: Initializers
        private init() {}
    }
}

// MARK:- Preview
struct CustomWordsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWordsView()
            .environment(\.managedObjectContext, appDelegate.moc)
    }
}
