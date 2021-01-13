import Foundation
import Combine

final class TestSearchModel: SearchModelProtocol {
    var books: [Book] = {
        TestModel().bookingDatas.map { $0.book }
    }()
    
    @Published var searchText = "" {
        didSet { search() }
    }
    
    func search() {
        books = books.shuffled()
    }
}
