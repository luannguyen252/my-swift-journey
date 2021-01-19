//
//  Collection+Safe.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 17.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
  
  /// Returns an element at the specified index if it is within bounds, otherwise nil.
  subscript(safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
  
  /// Returns subrange of collection's elements if specified range of indices lies within collection's bounds, otherwise nil.
  subscript(safe bounds: Range<Index>) -> SubSequence? {
    guard indices.contains(bounds.lowerBound) else {
      return nil
    }
    
    if !indices.contains(bounds.upperBound) {
      return self[bounds.lowerBound..<self.endIndex]
    }
    
    return self[bounds]
  }
}
