//
//  AddBookView.swift
//  BookWorm
//
//  Created by Sandesh on 11/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy" // Challenge 1 default genre
    @State private var review = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                
                Section{
                    Button("Save Book") {
                        let book  = Book(context: self.moc)
                        book.title = self.title
                        book.author = self.author
                        book.rating = Int16(self.rating)
                        book.genre = self.genre
                        book.review = self.review
                        book.date = Date() //// challenge 3 part 1
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
