import Foundation
import Combine

final class SearchModel: SearchModelProtocol {
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    @Published var books = Model().bookingDatas.map { $0.book }
    
    var searchText = "" {
        didSet { search() }
    }
    
    func search() {
        guard let cordedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let countryCode = Locale.current.regionCode?.lowercased(),
            let languageCode = Locale.current.languageCode,
            let url = URL(string: "https://itunes.apple.com/search?term=\(cordedText)&media=ebook&entity=ebook&country=\(countryCode)&limit=15&lang=\(languageCode)") else { return }
        
        URLSession.shared.dataTask(with: url) { (result, _, error) in
            if let error = error {
                print("API(iTunesAPI) ERROR: \(error)"); return
            }else if let result = result {
                do {
                    let decoded = try self.decoder.decode(iTunesAPIResponse.self, from: result)
                    DispatchQueue.main.async {
                        self.books = decoded.results.map(Self.itunesAPIResponseToBook(from:))
                    }
                }catch let error {
                    print("decode error: \(error)")
                }
            }
        }
        .resume()
    }
}
