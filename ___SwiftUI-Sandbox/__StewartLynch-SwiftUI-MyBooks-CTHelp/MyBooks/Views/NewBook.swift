//
//  NewBook.swift
//  MyBooks
//
//  Created by Stewart Lynch on 2020-08-28.
//

import SwiftUI

struct NewBook: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var bookVM:BooksViewModel
    @State private var newBook = Book(title: "", author: "", notes: "")
    let ctHelp = CTHelpBuilder.getHelpItems(page: .newBook)
    @State private var showCTHelp = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section(header: Text("Title and author")) {
                        TextField("Title", text: $newBook.title)
                        TextField("Author", text: $newBook.author)
                    }
                    Section(header: Text("Notes")) {
                        TextEditor(text: $newBook.notes)
                            .frame(height: 350)
                    }
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 25) {
                            Button("Add Book") {
                                bookVM.addBook(newBook)
                                self.presentationMode.wrappedValue.dismiss()
                            }.disabled(newBook.title.isEmpty || newBook.author.isEmpty)
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
            })
                if showCTHelp {
                    ctHelp.showCTHelpScreens(isPresented: $showCTHelp, ctHelp: ctHelp)
                }
            }
        }
    }
}

struct NewBook_Previews: PreviewProvider {
    static var previews: some View {
        NewBook(bookVM: BooksViewModel())
    }
}
