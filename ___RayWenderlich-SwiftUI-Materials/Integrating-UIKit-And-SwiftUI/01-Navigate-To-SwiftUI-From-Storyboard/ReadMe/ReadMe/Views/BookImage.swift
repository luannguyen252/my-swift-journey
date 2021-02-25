import SwiftUI
import UIKit

struct BookImage: View {
  var book: Book

  private var imageAvailable: Bool {
    switch book.image {
    case .some: return true
    default: return false
    }
  }
  
  private var bookmark: some View {
    let image: Image =
    book.readMe
      ? Image(systemName: LibrarySymbol.bookmarkFill)
      : Image(systemName: LibrarySymbol.bookmark)
    
    return image.resizable().scaledToFit()
  }
  
  var body: some View {
      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
        if imageAvailable {
          Image(uiImage: book.image!)
            .resizable()
            .scaledToFill()
        } else {
          PlaceholderImage(size: CGSize(width: 200, height: 200))
        }
        
        VStack {
          Button { book.readMe.toggle() }
            label: {
              bookmark
                .frame(height: 100)
            }
            .padding()
          
          Spacer()
        }
        
        HStack {
          TitleAuthorView(title: book.title, author: book.author)
          Spacer()
        }
        .foregroundColor(Color("ImageText"))
        .blendMode(.colorDodge)
        .background(
          Color.accentColor
            .opacity(0.75)
        )
      }
      .cornerRadius(25)
    }
}


// MARK: - Previews
struct BookImage_Previews: PreviewProvider {
  static let book = Book(title: "Doodle All Year", author: "Taro Gomi", review: nil, readMe: false, image: UIImage(named: "DoodleAllYear"))
  
  static var previews: some View {
    BookImage(book: book)
      .aspectRatio(1, contentMode: .fit)
      .padding()
      .previewLayout(.sizeThatFits)
    
    BookImage(book: book)
      .preferredColorScheme(.dark)
      .aspectRatio(1.5, contentMode: .fit)
      .padding()
      .previewLayout(.sizeThatFits)
    
    BookImage(book: Library.starterData[0])
      .aspectRatio(1.2, contentMode: .fit)
      .padding()
      .previewLayout(.sizeThatFits)
    
    BookImage(book: Library.starterData[0])
      .preferredColorScheme(.dark)
      .aspectRatio(1, contentMode: .fit)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}

struct PlaceholderImage: View {
  let size: CGSize
  
  var body: some View {
    ZStack {
      Color("BackgroundGray")
      Image(systemName: LibrarySymbol.books)
        .resizable()
        .scaledToFit()
        .frame(width: size.width * 0.65)
        .foregroundColor(Color("Placeholder"))
    }
  }
}

struct TitleAuthorView: View {
  let title: String
  let author: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.title2)
        .fontWeight(.bold)
      
      Text(author)
        .font(.headline)
        .fontWeight(.regular)
    }
    .padding()
  }
}
