//
//  File.swift
//  
//
//  Created by Max Kuznetsov on 21.10.2020.
//

import Foundation

public enum Flows {}

public extension Flows {
    struct Id: Hashable {
        var value: String
        
        public init(value: String) {
            self.value = value
        }
    }
}
