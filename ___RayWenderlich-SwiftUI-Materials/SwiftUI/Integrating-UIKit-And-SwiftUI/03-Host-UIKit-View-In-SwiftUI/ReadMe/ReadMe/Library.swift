/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

// MARK:- Reusable SFSymbol Images
enum LibrarySymbol {
  static let bookmark = "bookmark"
  static let bookmarkFill = "bookmark.fill"
  static let books = "books.vertical.fill"
  
  static func letterCircle(letter: Character?) -> String {
    return "\(letter?.lowercased() ?? "")" + ".circle"
  }
}

// MARK:- Library
enum Library {
  static let starterData = [
    Book(title: "Ein Neues Land", author: "Shaun Tan", readMe: true),
    Book(title: "Bosch", author: "Laurinda Dixon", readMe: true),
    Book(title: "Dare to Lead", author: "Brené Brown", readMe: false),
    Book(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet", readMe:  false),
    Book(title: "Drinking with the Saints", author: "Michael P. Foley", readMe: true),
    Book(title: "A Guide to Tea", author: "Adagio Teas", readMe: false),
    Book(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson", readMe: true),
    Book(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington", readMe: false),
    Book(title: "How to Draw Cats", author: "Janet Rancan", readMe: true),
    Book(title: "Drawing People", author: "Barbara Bradley", readMe: false),
    Book(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter", readMe: true)
  ]
  
  static var books: [Book] = loadBooks()
  
  private static let booksJSONURL = URL(fileURLWithPath: "Books",
                                relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("json")
  
  
  /// This method loads all existing data from the `booksJSONURL`, if available. If not, it will fall back to using `starterData`
  /// - Returns: Returns an array of books, loaded from a JSON file
  private static func loadBooks() -> [Book] {
      let decoder = JSONDecoder()

      guard let booksData = try? Data(contentsOf: booksJSONURL) else {
        return starterData
      }

      do {
        let books = try decoder.decode([Book].self, from: booksData)
        return books.map { libraryBook in
          Book(
            title: libraryBook.title,
            author: libraryBook.author,
            review: libraryBook.review,
            readMe: libraryBook.readMe,
            image: loadImage(forBook: libraryBook)
          )
        }
        
      } catch let error {
        print(error)
        return starterData
      }
  }
  
  private static func saveAllBooks() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
      let booksData = try encoder.encode(books)
      try booksData.write(to: booksJSONURL, options: .atomicWrite)
    } catch let error {
      print(error)
    }
  }
  
  /// Adds a new book to the `books` array and saves it to disk.
  /// - Parameters:
  ///   - book: The book to be added to the library.
  ///   - image: An optional image to associate with the book.
  static func addNew(book: Book) {
    if let image = book.image { saveImage(image, forBook: book) }
    books.insert(book, at: 0)
    saveAllBooks()
  }
  
  
  /// Updates the stored value for a single book.
  /// - Parameter book: The book to be updated.
  static func update(book: Book) {
    if let newImage = book.image {
      saveImage(newImage, forBook: book)
    }
    saveAllBooks()
  }
  
  /// Removes a book from the `books` array.
  /// - Parameter book: The book to be deleted from the library.
  static func delete(book: Book) {
    guard let bookIndex = books.firstIndex(where: { storedBook in
      book == storedBook } )
      else { return }
  
    books.remove(at: bookIndex)
    
    let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(book.title)
    do {
      try FileManager().removeItem(at: imageURL)
    } catch let error { print(error) }
    
    saveAllBooks()
  }
  
  static func reorderBooks(bookToMove: Book, bookAtDestination: Book) {
    let destinationIndex = Library.books.firstIndex(of: bookAtDestination) ?? 0
    books.removeAll(where: { $0.title == bookToMove.title })
    books.insert(bookToMove, at: destinationIndex)
    saveAllBooks()
  }
  
  /// Saves an image associated with a given book title.
  /// - Parameters:
  ///   - image: The image to be saved.
  ///   - title: The title of the book associated with the image.
  static func saveImage(_ image: UIImage, forBook book: Book) {
    let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(book.title)
    if let jpgData = image.jpegData(compressionQuality: 0.7) {
      try? jpgData.write(to: imageURL, options: .atomicWrite)
    }
  }
  
  /// Loads and returns an image for a given book title.
  /// - Parameter title: Title of the book you need an image for.
  /// - Returns: The image associated with the given book title.
  static func loadImage(forBook book: Book) -> UIImage? {
    let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(book.title)
    return UIImage(contentsOfFile: imageURL.path)
  }
}

extension FileManager {
  static var documentDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
