//
//  Copyright © 2019 An Tran. All rights reserved.
//

struct ImageListModel: Decodable {
    var total: Int
    var totalHits: Int
    var hits: [ImageModel]
}
