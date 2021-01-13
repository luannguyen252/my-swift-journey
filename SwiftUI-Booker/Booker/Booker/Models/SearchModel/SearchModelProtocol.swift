import Foundation
import Combine

protocol SearchModelProtocol: ObservableObject {
    var books: [Book] { get set }
    var searchText: String { get set }
    func search()
    static func itunesAPIResponseToBook(from res: iTunesAPIResponse.Result) -> Book
}

extension SearchModelProtocol {
    static func itunesAPIResponseToBook(from res: iTunesAPIResponse.Result) -> Book {
        Book(name: res.trackName,
             writer: res.artistName,
             about: res.description,
             imageURL: {
                 var url = URL(string: res.artworkUrl100)!
                 url.deleteLastPathComponent()
                 url.appendPathComponent("1024x1024bb.jpg")
                 return url
             }(),
             smallImageURL: URL(string: res.artworkUrl100)!,
             url: URL(string: res.trackViewUrl)!,
             releaseDate: res.releaseDate!,
             price: res.formattedPrice,
             genres: res.genres)
        
    }
}
