import Foundation

struct Book: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let writer: String?
    let about: String?
    let imageURL: URL?
    let smallImageURL: URL?
    let url: URL?
    let releaseDate: Date?
    let price: String?
    let genres: [String]?
    
    init(name: String, writer: String? = nil, about: String? = nil,
         imageURL: URL? = nil, smallImageURL: URL? = nil,
         url: URL? = nil, releaseDate: Date? = nil,
         price: String? = nil, genres: [String]? = nil) {
        self.name = name; self.writer = writer; self.about = about
        self.imageURL = imageURL; self.smallImageURL = smallImageURL
        self.url = url; self.releaseDate = releaseDate
        self.price = price; self.genres = genres
    }
}

extension Book: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    var description: String { "\(name)  -\(writer ?? "")" }
    var debugDescription: String { "\(id)  -\(name)" }
    var customMirror: Mirror { Mirror(reflecting: self) }
}

extension Book: Codable, UserDefaultConvertible {}
