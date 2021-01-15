//
//  Array+MakesASet.swift
//  Set Game
//
//  Created by Matthew Trump on 7/24/20.
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
    func firstMatchingTriple(matchBy: (Array<Element>) -> Bool) -> Array<Element>?{
        outerLoop: for firstIndex in 0..<self.count{
            let firstElement : Element = self[firstIndex]
            for secondIndex in firstIndex+1..<self.count{
                let secondElement = self[secondIndex]
                for thirdIndex in secondIndex+1..<self.count{
                    let possibleMatch = [firstElement,secondElement,self[thirdIndex]]
                    if(matchBy(possibleMatch)){
                        return possibleMatch
                    }
                }
            }
        }
        return nil
    }
}

