import Foundation
import Combine

/// @mockable
public protocol ItemRepository {
    func fetch(page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Swift.Result<[Item], Error>) -> Void)
}
