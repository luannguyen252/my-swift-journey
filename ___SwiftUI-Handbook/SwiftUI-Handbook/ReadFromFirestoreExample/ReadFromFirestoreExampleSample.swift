import SwiftUI

/// https://peterfriese.dev/swiftui-firebase-fetch-data/

struct Book: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var author: String
    var numberOfPages: Int
}

let testData = [
    Book(title: "The Ultimate Hitchhiker's Guide to the Galaxy: Five Novels in One Outrageous Volume", author: "Douglas Adams", numberOfPages: 815),
    Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474),
    Book(title: "Toll", author: "Matt Gemmell", numberOfPages: 474)
]

struct ReadFromFirestoreExampleSample: View {
    var books = testData

    var body: some View {
        NavigationView {
            List(books) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                    Text("\(book.numberOfPages) pages")
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Books")
        }
    }
}

#if DEBUG
struct ReadFromFirestoreExampleSample_Previews: PreviewProvider {
    static var previews: some View {
        ReadFromFirestoreExampleSample()
    }
}
#endif
