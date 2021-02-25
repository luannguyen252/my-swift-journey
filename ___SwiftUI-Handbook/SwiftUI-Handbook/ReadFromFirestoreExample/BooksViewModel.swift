import Foundation
import Firebase

//class BooksViewModel: ObservableObject {
//    @Published var books = [Book]()
//    
//    private var db = Firestore.firestore()
//    
//    func fetchData() {
//        db.collection("books").addSnapshotListener { (querySnapshot, error) in
//            
//            guard let documents = querySnapshot?.documents else {
//        print("No documents")
//        return
//      }
//
//      self.books = documents.map { queryDocumentSnapshot -> Book in
//        let data = queryDocumentSnapshot.data()
//        let title = data["title"] as? String ?? ""
//        let author = data["author"] as? String ?? ""
//        let numberOfPages = data["pages"] as? Int ?? 0
//
//        return Book(id: .init(), title: title, author: author, numberOfPages: numberOfPages)
//      }
//    }
//  }
//}
