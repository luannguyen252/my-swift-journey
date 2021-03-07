//
//  BookDetail.swift
//  MyBooks
//
//  Created by Stewart Lynch on 2020-08-28.
//

import SwiftUI

struct BookDetail: View {
    @Binding var book:Book
    var saveUpdates: (Bool) -> Void
    @State var dirty = false
    let ctHelp = CTHelpBuilder.getHelpItems(page: .bookDetail)
    @State private var showCTHelp = false
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Title and Author")) {
                    TextField("Title", text: $book.title)
                    TextField("Author", text: $book.author)
                }
                Section(header: Text("Notes")) {
                    TextEditor(text: $book.notes)
                        .frame(height: 350)
                }
            }
            .padding()
            .onChange(of: book.notes) { _ in
                self.dirty = true
            }
            .onChange(of: book.title) { _ in
                dirty = true
            }
            .onChange(of: book.author) { _ in
                dirty = true
            }
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            showCTHelp = true
                        }
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.title)
                    }
                }
            }
            .onDisappear {
                // Only save updates if there was an editing change
                saveUpdates(dirty)
        }
            if showCTHelp {
                ctHelp.showCTHelpScreens(isPresented: $showCTHelp, ctHelp: ctHelp)
            }
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookDetail(book: .constant(Book(title: "My Great Book", author: "Stewart Lynch", notes: "Very Good Book")), saveUpdates: {_ in })
        }
    }
}
