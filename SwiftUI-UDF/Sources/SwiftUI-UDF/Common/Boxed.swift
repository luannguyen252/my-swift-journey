//
//  Boxed.swift
//  UDF
//
//  Created by Max Kuznetsov on 06.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

@propertyWrapper
public final class Boxed<Value> {
    public var wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}
