import Foundation

struct iTunesAPIResponse: Decodable {
    struct Result: Decodable {
        let artworkUrl100: String
        let trackViewUrl: String
        let releaseDate: Date?
        let formattedPrice: String
        let trackName: String
        let description: String
        let artistName: String
        let genres: [String]
        private init() {
            artworkUrl100 = ""; trackViewUrl = ""; releaseDate = nil;
            formattedPrice = ""; trackName = ""; description = "";
            artistName = ""; genres = []
        }
    }
    var results: [Result]
}

let testData = """
{
 "resultCount":1,
 "results": [
 
{
"artworkUrl60":"https://is2-ssl.mzstatic.com/image/thumb/Publication128/v4/cc/ae/5b/ccae5b6d-c3d1-213e-7fac-1e686caa8775/source/60x60bb.jpg",
"artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Publication128/v4/cc/ae/5b/ccae5b6d-c3d1-213e-7fac-1e686caa8775/source/100x100bb.jpg",
"artistViewUrl":"https://books.apple.com/jp/artist/%E6%B6%88%E6%A5%B5%E6%80%A7%E7%A0%94%E7%A9%B6%E4%BC%9A-%E5%B0%8F%E9%87%8E%E3%81%BB%E3%82%8A%E3%81%A7%E3%81%84/1334545052?uo=4",
"trackCensoredName":"消極性デザイン宣言",
"fileSizeBytes":10405997,
"trackViewUrl":"https://books.apple.com/jp/book/%E6%B6%88%E6%A5%B5%E6%80%A7%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E5%AE%A3%E8%A8%80/id1334544698?uo=4",
"releaseDate":"2018-01-12T04:39:31Z",
"genreIds":["10017", "38", "9027"],
"formattedPrice":"¥2,000",
"artistIds":[1334545052, 726043346],
"currency":"JPY",
"trackName":"消極性デザイン宣言",
"trackId":1334544698,
"description":"情報科学分野の気鋭の若手研究者たちがたちあげた「消極性研究会」がお届けする、コミュニケーションとモチベーションをデザイン(=SHY HACK)するための知恵とコツ。積極的になれないことややる気が湧かないことに悩む方、あるいはユニバーサルなシステムやサービスを設計したい方とって、大きな学びが得られる一冊。研究会の色濃いメンバーが、最先端の研究成果、はたまた自身の奥深い経験談を語り尽くします。",
"artistId":1334545052,
"artistName":"消極性研究会 & 小野ほりでい",
"genres":["コンピュータ", "ブック", "コンピュータ／インターネット"],
"kind":"ebook",
"price":2000.00
}

]
}
""".data(using: .utf8)!
