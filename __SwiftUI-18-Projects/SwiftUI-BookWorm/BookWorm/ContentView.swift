//
//  ContentView.swift
//  BookWorm
//
//  Created by Sandesh on 11/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: false),
                                    NSSortDescriptor(keyPath: \Book.author, ascending: false)
    ]) var books: FetchedResults<Book>
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(books, id: \.self) { book  in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                                .foregroundColor( book.rating == 1 ? .red : .black)
                            Text(book.author ??  "Unknown authoer")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            .onDelete(perform: deleteBook)
            }
            .navigationBarTitle("Book Worms")
            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
                self.showAddScreen = true
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $showAddScreen) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func deleteBook( at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
