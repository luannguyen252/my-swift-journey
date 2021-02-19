//
//  Array-IndexWrapping.swift
//  Created by Julian Schiavo on 13/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

/// Helper methods to use a default value when subscripting and wrap the last index to the first
public extension Array {
    subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else { return defaultValue() }
        return self[index]
    }
    
    func wrappedIndex(after index: Int) -> Int {
        (self.index(after: index) % self.count + self.count) % self.count
    }
}
