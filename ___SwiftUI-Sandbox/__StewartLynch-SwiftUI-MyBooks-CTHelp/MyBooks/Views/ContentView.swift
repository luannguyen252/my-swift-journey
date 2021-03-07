//
//  ContentView.swift
//  MyBooks
//
//  Created by Stewart Lynch on 2020-08-28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var booksVM = BooksViewModel()
    @State private var createNewBook = false
    let ctHelp = CTHelpBuilder.getHelpItems(page: .contentView)
    @State private var showCTHelp = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(booksVM.books) { book in
                        NavigationLink(
                            destination: BookDetail(book: selectedBook(id: book.id), saveUpdates: saveUpdates)) {
                            HStack(spacing: 10) {
                                Image("MyBooksLogo")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading) {
                                    Text("\(book.title)").font(.headline)
                                    Text("\(book.author)").font(.caption)
                                    if book.isSample {
                                        HStack {
                                            Spacer()
                                            Text("Sample Book")
                                                .font(.caption2)
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                            }
                        }
                        
                    }.onDelete(perform: { indexSet in
                        booksVM.deleteBook(at: indexSet)
                    })
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("My Books")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 25) {
                            Button(action: {
                                createNewBook = true
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            }
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
                }
                )
                .fullScreenCover(isPresented: $createNewBook) {
                    NewBook(bookVM: booksVM)
            }
                if showCTHelp {
                    ctHelp.showCTHelpScreens(isPresented: $showCTHelp, ctHelp: ctHelp)
                }
            }
        }
    }
    
    func saveUpdates(_ isDirty:Bool) {
        if isDirty {
            BooksViewModel.storeBooks(books: booksVM.books)
        }
    }
    
    func selectedBook(id: UUID) -> Binding<Book> {
        guard let index = self.booksVM.books.firstIndex(where: { $0.id == id }) else {
            fatalError("This person does not exist.")
        }
        return self.$booksVM.books[index]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
