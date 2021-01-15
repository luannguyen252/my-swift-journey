//
//  Combine+Error.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine
extension AnyPublisher {
    
    static func error<T, E>(_ error: E) -> AnyPublisher<T, E> {
        return Future<T, E> { $0(.failure(error)) }.eraseToAnyPublisher()
    }
    
}


extension Future {
    
    static func error<Void, E>(_ error: E) -> Future<Void, E> {
        Future<Void, E> { $0(.failure(error)) }
    }
    
}


enum CombineError: Error {
    
    case released
    
}
