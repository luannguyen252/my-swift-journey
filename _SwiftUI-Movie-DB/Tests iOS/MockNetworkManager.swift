//
//  MockNetworkManagerStack.swift
//  Movie-DB-SwiftUITests
//
//  Created by Vidhyadharan on 26/12/20.
//

import UIKit
import Combine
@testable import Movie_DB_SwiftUI

class MockNetworkManager: NetworkManagerProtocol {
    var failureError: NetworkManagerError? = nil
    var successObject: AnyObject? = nil

    func apiDataTask<T>(endpoint: EndPoint, decoder: JSONDecoder) -> AnyPublisher<T?, NetworkManagerError> where T : Codable {
        guard self.failureError == nil else {
            return Result.failure(self.failureError!).publisher.eraseToAnyPublisher()
        }

        return Result.success(self.successObject as? T).publisher.eraseToAnyPublisher()
    }
}
