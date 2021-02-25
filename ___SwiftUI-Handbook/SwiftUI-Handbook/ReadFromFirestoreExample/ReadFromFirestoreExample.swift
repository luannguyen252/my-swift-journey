import SwiftUI

/// https://github.com/firebase/firebase-ios-sdk.git
/// https://designcode.io/swiftui-handbook-read-from-firestore

//struct ReadFromFirestoreExample: View {
//    @ObservedObject var viewModel = BooksViewModel() /// Using the @ObservedObject property wrapper
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.books) { book in
//                VStack(alignment: .leading) {
//                    Text(book.title)
//                        .font(.headline)
//                    Text(book.author)
//                        .font(.subheadline)
//                    Text("\(book.numberOfPages) pages")
//                        .font(.subheadline)
//                }
//            }
//            .navigationBarTitle("Books")
//            .onAppear() {
//                self.viewModel.fetchData()
//            }
//        }
//    }
//}
