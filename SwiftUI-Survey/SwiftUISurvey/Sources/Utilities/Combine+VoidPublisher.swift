//
//  Combine+VoidPublisher.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine

typealias VoidPublisher = AnyPublisher<Void, Error>


extension Publisher {
    
    func eraseToVoidPublisher() -> VoidPublisher {
        map { _ in Void() }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
}
