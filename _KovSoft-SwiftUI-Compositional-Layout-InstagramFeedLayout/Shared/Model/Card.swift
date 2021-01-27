import SwiftUI

struct Card: Identifiable,Decodable,Hashable {
    var id: String
    var download_url: String
    var author: String
}

