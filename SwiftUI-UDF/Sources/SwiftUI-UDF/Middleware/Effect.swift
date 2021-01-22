//
//  Effect.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import Combine

//TODO: Should be a custom publisher
//TODO: add queue to declaration

public protocol Effect {
    associatedtype Error: Swift.Error
    
    func upstream() -> AnyPublisher<AnyAction, Error>
}
