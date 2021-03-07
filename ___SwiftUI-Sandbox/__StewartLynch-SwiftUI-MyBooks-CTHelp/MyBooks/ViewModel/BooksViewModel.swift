//
//  BooksViewModel.swift
//  MyBooks
//
//  Created by Stewart Lynch on 2020-08-28.
//

import SwiftUI

class BooksViewModel: ObservableObject {
    @AppStorage("books") static var booksJSON = ""
    @Published var books:[Book] = []

    init() {
        books = BooksViewModel.retrieveBooks()
    }

    func addBook(_ book: Book) {
        books.append(book)
        BooksViewModel.storeBooks(books: books)
    }


    func deleteBook(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
        BooksViewModel.storeBooks(books: books)
    }



    // Static functions to manage persistence
    static func retrieveBooks() -> [Book] {
        if booksJSON != "" {
            let decoder = JSONDecoder()
            let data = Data(booksJSON.utf8)
            guard let books = try? decoder.decode([Book].self, from: data)  else {
                fatalError("Failed to decode JSON from data")
            }
            return books
        } else {
            BooksViewModel.storeBooks(books: BooksViewModel.sampleBooks)
            return BooksViewModel.sampleBooks
        }
    }

    static func storeBooks(books: [Book]) {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(books) else {
            fatalError("Unable to encode data")
        }
        BooksViewModel.booksJSON = String(data: jsonData, encoding: .utf8)!
        print("booksJSON Updated - \(BooksViewModel.booksJSON)")

    }

    // Sample data for first launch
    static let sampleBooks:[Book] = [
        Book(title: "A Conspiracy of Faith", author: "Jussi Alder-Olsen", notes: "3rd of the Department Q series", isSample: true),
        Book(title: "Broken Harbour", author: "Tana French", notes: "Dublin Murder Squad #4", isSample: true),
        Book(title: "Fall of Giants", author: "Ken Follett", notes: "The Century Trilogy book 1", isSample: true)
    ]
}
