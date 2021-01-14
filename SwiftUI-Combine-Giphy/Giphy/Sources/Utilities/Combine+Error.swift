//
//  Combine+Error.swift
//  Giphy
//
//  Created by Amir on 28/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Combine

extension AnyPublisher {
    
    static func error<T, E>(_ error: E) -> AnyPublisher<T, E> {
        return Future<T, E> { $0(.failure(error)) }.eraseToAnyPublisher()
    }
}


enum CombineError: Error {
    
    // MARK: Cases
    
    case released
}
