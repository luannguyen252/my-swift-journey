import SwiftUI

struct BookingData: Hashable, Identifiable, Comparable {
    var id: Date { createDate }
    var book: Book
    var createDate: Date
    var about = ""
    var opinion = ""
    
    var readAgain: Bool {
        get { (UserDefaults.standard.get(.dataReadAgain) ?? []).contains(self) }
        set {
            var datas = UserDefaults.standard.get(.dataReadAgain) ?? []
            if newValue { datas.insert(self) }else { datas.remove(self) }
            UserDefaults.standard.set(datas, forKey: .dataReadAgain)
        }
    }
    
    static func < (lhs: BookingData, rhs: BookingData) -> Bool {
        lhs.createDate < rhs.createDate
    }
    
    init(book: Book, createdAt: Date = Date(), about: String, opinion: String) {
        (self.book, self.createDate, self.about, self.opinion) = (book, createdAt, about, opinion)
    }
}

extension BookingData: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String { "\(book.name)  -\(createDate.description)" }
    var debugDescription: String { "\(id.description)  -\(book.name)" }
}

extension BookingData: Codable, UserDefaultConvertible {}
