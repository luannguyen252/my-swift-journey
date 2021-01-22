//
//  Middleware.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

public protocol Middleware {
    associatedtype State
    
    var store: Store<State> { get }
    var asObserver: Observer<State> { get }
    
    func observe(state: State)
}
