//
//  Array+Extension.swift
//  Tests iOS
//
//  Created by Vidhyadharan on 05/01/21.
//

import Foundation

extension Array {
    
    func dropAllButLast() -> ArraySlice<Element> {
        return self.dropFirst(self.count - 1)
    }
    
}
