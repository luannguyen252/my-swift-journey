//
//  Observer.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

public class Observer<State>: Hashable {
    public static func == (lhs: Observer<State>, rhs: Observer<State>) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(self).hash(into: &hasher)
    }
    
    public enum Status {
        case active
        case postponed(Int)
        case dead
    }
    
    public let queue: DispatchQueue
    public let observe: (State) -> Status
    
    public init(queue: DispatchQueue, observe: @escaping (State) -> Status) {
        self.queue = queue
        self.observe = observe
    }
}
