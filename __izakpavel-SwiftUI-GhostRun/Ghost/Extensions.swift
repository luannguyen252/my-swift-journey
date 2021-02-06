//
//  Extensions.swift
//  Ghost
//
//  Created by Pavel Zak on 29/10/2020.
//

import Foundation
import SwiftUI

extension CGPoint {
    static func * ( left : CGPoint , right : CGFloat) -> CGPoint {
        return CGPoint(x: left.x * right, y: left.y * right)
    }

    static func * ( left : CGFloat , right : CGPoint) -> CGPoint {
        return CGPoint(x: right.x * left, y: right.y * left)
    }
    
    static func * ( left : CGPoint , right : Int) -> CGPoint {
        return CGPoint(x: left.x * CGFloat(right), y: left.y * CGFloat(right))
    }

    static func * ( left : Int , right : CGPoint) -> CGPoint {
        return CGPoint(x: right.x * CGFloat(left), y: right.y * CGFloat(left))
    }
    
    static func + ( left : CGPoint , right : CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
}
