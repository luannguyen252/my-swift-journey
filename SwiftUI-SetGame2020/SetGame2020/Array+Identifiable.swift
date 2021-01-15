//
//  Array+Identifiable.swift
//  Set Game
//
//  Created by Matthew Trump on 7/17/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import Foundation

//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Matthew Trump on 7/13/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count {
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
