//
//  Sequence+sorted.swift
//  cool1
//
//  Created by 観周 横尾 on 06/04/2020.
//  Copyright © 2020 midleemaster. All rights reserved.
//

import Foundation
extension Sequence {
    func sorted<T: Comparable>(by keyPath:KeyPath<Element, T>) -> [Element]{
        return sorted {a, b in
            return a[keyPath: keyPath] < b[keyPath:keyPath]
        }
    }
    
    func map <T> (_ keyPath: KeyPath<Element, T>) -> [T] {
        return map {$0[keyPath: keyPath]}
    }
    
    func min <T: Comparable> (_ keyPath: KeyPath<Element, T>) -> T? {
        return map(keyPath).min()
    }
    
    func max<T: Comparable> (_ keyPath: KeyPath<Element, T>) -> T? {
        return map(keyPath).max()
    }
}
