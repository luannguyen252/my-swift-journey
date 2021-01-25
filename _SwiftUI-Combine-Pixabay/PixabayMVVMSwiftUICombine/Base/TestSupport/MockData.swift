//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Combine

#if DEBUG

let testData = ImageListModel(
    total: 6,
    totalHits: 6,
    hits: [
        ImageModel(id: 1, largeImageURL: "https://via.placeholder.com/150", previewURL: "https://via.placeholder.com/50"),
        ImageModel(id: 2, largeImageURL: "https://via.placeholder.com/150", previewURL: "https://via.placeholder.com/50"),
        ImageModel(id: 3, largeImageURL: "https://via.placeholder.com/150", previewURL: "https://via.placeholder.com/50"),
        ImageModel(id: 4, largeImageURL: "https://via.placeholder.com/150", previewURL: "https://via.placeholder.com/50"),
        ImageModel(id: 5, largeImageURL: "https://via.placeholder.com/150", previewURL: "https://via.placeholder.com/50"),
        ImageModel(id: 6, largeImageURL: "https://via.placeholder.com/150", previewURL: "https://via.placeholder.com/50"),
    ]
)

class PixaBayServiceMock: PixaBayServiceProtocol {
    func fetch(searchTerm: String) -> Future<ImageListModel, Error> {
        return Future { resolver in
            return resolver(self.result)
        }
    }

    var result: Result<ImageListModel, Error> = Result.success(testData)
}

#endif
