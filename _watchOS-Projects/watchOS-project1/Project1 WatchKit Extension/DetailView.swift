//
//  DetailView.swift
//  Project1 WatchKit Extension
//
//  Created by Paul Hudson on 07/10/2020.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let index: Int
    let note: Note

    // MARK: - BODY
    var body: some View {
        Text(note.text)
            .navigationTitle("Note \(index + 1)")
    }
}

// MARK: - PREVIEW
#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(index: 1, note: Note(id: UUID(), text: "Hello, World!"))
    }
}
#endif
