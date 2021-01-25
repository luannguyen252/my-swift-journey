//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Foundation
import Combine

/// Service responsible for fetching images from Pixabay.com
class PixaBayService: PixaBayServiceProtocol {

    func fetch(searchTerm: String) -> Future<ImageListModel, Error> {
        let urlString = "https://pixabay.com/api/?key=107764-f19c20d5ca4d545d9b0a09de3&q=\(searchTerm)&image_type=photo&pretty=true"
        let url = URL(string: urlString)!

        return Future { resolver in

            URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil else {
                    return resolver(Result.failure(error!))
                }

                guard let data = data else {
                    return resolver(Result.failure(ServiceNetworkError.noData))
                }

                do {
                    let decoder = JSONDecoder()
                    let imageData = try decoder.decode(ImageListModel.self, from: data)
                    return resolver(Result.success(imageData))
                } catch let DecodingError.dataCorrupted(context) {
                    print(context.debugDescription)
                    return resolver(Result.failure(ServiceParsingError.dataCorrupted))
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found: \(context.debugDescription)")
                    print("codingPath: \(context.codingPath)")
                    return resolver(Result.failure(ServiceParsingError.keyNotFound))
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found: \(context.debugDescription)")
                    print("codingPath: \(context.codingPath)")
                    return resolver(Result.failure(ServiceParsingError.valueNotFound))
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch: \(context.debugDescription)")
                    print("codingPath: \(context.codingPath)")
                    return resolver(Result.failure(ServiceParsingError.typeMismatch))
                } catch {
                    print("error: \(error)")
                    return resolver(Result.failure(ServiceParsingError.generalError(error)))
                }
            }.resume()
        }
    }
}

enum ServiceNetworkError: Error {
    case noData
    case httpError(_ error: Error)
}

enum ServiceParsingError: Error {
    case dataCorrupted
    case keyNotFound
    case valueNotFound
    case typeMismatch
    case generalError(_ error: Error)
}
