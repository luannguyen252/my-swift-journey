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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State var addingNewBook = false
  @EnvironmentObject var library: Library

  var body: some View {
    NavigationView {
      List {
        Button {
          addingNewBook = true
        } label: {
          Spacer()

          VStack(spacing: 6) {
            Image(systemName: "book.circle")
              .font(.system(size: 60))
            Text("Add New Book")
              .font(.title2)
          }
          
          Spacer()
        }
        .buttonStyle(BorderlessButtonStyle())
        .padding(.vertical, 8)
        .sheet(
          isPresented: $addingNewBook,
          content: NewBookView.init
        )

        switch library.sortStyle {
        case .title, .author:
          BookRows(data: library.sortedBooks, section: nil)
        case .manual:
          ForEach(Section.allCases, id: \.self) {
            SectionView(section: $0)
          }
        }
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Menu("Sort") {
            Picker("Sort Style", selection: $library.sortStyle) {
              ForEach(SortStyle.allCases, id: \.self) { sortStyle in
                Text("\(sortStyle)".capitalized)
              }
            }
          }
        }
        ToolbarItem(content: EditButton.init)
      }
      .navigationBarTitle("My Library")
    }
  }
}

private struct BookRows: DynamicViewContent {
  let data: [Book]
  let section: Section?
  @EnvironmentObject var library: Library

  var body: some View {
    ForEach(data) {
      BookRow(book: $0)
    }
    .onDelete { indexSet in
      library.deleteBooks(atOffsets: indexSet, section: section)
    }
  }
}

private struct BookRow: View {
  @ObservedObject var book: Book
  @EnvironmentObject var library: Library

  var body: some View {
    NavigationLink(
      destination: DetailView(book: book)
    ) {
      HStack {
        Book.Image(
          uiImage: library.uiImages[book],
          title: book.title,
          size: 80,
          cornerRadius: 12
        )

        VStack(alignment: .leading) {
          TitleAndAuthorStack(
            book: book,
            titleFont: .title2,
            authorFont: .title3
          )

          if !book.microReview.isEmpty {
            Spacer()
            Text(book.microReview)
              .font(.subheadline)
              .foregroundColor(.secondary)
          }
        }
        .lineLimit(1)

        Spacer()

        BookmarkButton(book: book)
          .buttonStyle(BorderlessButtonStyle())
      }
      .padding(.vertical, 8)
    }
  }
}

private struct SectionView: View {
  let section: Section
  @EnvironmentObject var library: Library

  var title: String {
    switch section {
    case .readMe:
      return "Read Me!"
    case .finished:
      return "Finished!"
    }
  }

  var body: some View {
    if let books = library.manuallySortedBooks[section] {
      SwiftUI.Section(
        header:
          ZStack {
            Image("BookTexture")
              .resizable()
              .scaledToFit()
            Text(title)
              .font(.custom("American Typewriter", size: 24))
          }
          .listRowInsets(.init())
      ) {
        BookRows(data: books, section: section)
          .onMove { indices, newOffset in
            library.moveBooks(
              oldOffsets: indices, newOffset: newOffset,
              section: section
            )
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Library())
      .previewedInAllColorSchemes
  }
}
