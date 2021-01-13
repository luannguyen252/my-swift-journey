import Foundation
import Combine

final class TestModel: ModelProtocol {
    init() {  }
    
    @Published var bookingDatas: [BookingData] = {
        let aBook = Book(name: "HuMain Interface", writer: "Jef Raskin")
        let aDate = Date(month: 9, day: 25, hour: 15, minute: 2)
        let aData = BookingData(book: aBook, createdAt: aDate,
                                about: "",
                                opinion: "")
        let bBook = Book(name: "Ditective Conan", writer: "Gosyo Aoyama",
                         imageURL: URL(string: "conan"),
                         url: URL(string: "https://websunday.net/rensai/conan/"))
        let bData = BookingData(book: bBook,
                                about: "真実はいつも一つ！",
                                opinion: "警察学校編も早く読みたいけど、単行本いつ出るかね")
        let cBook = Book(name: "消極性デザイン宣言",
                         imageURL: URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Publication128/v4/cc/ae/5b/ccae5b6d-c3d1-213e-7fac-1e686caa8775/source/100x100bb.jpg"),
                         url: URL(string: "https://books.apple.com/jp/book/%E6%B6%88%E6%A5%B5%E6%80%A7%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E5%AE%A3%E8%A8%80/id1334544698?uo=4"))
        let cData = BookingData(book: cBook, createdAt: Date(year: 2018),
                                about: "消極的な人よ、声を上げよ。……いや、上げなくてよい。",
                                opinion: "読まねば")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let fromData = try! decoder.decode(iTunesAPIResponse.self, from: testData)
        let hoge = fromData.results
            .map(SearchModel.itunesAPIResponseToBook(from:)).enumerated()
            .map { BookingData(book: $1,
                               about: "読んでない本の詳細などと言われても困る。渡辺恵太さんが書いてることしか知らない",
                opinion: "読んでない本の感想などと言われても困る。多分いい本だろう。消極的な人よ、立ち上がれ。いや、立ち上がらなくて良い")
        }
        
        return [aData, bData, cData] + hoge
    }()
}
