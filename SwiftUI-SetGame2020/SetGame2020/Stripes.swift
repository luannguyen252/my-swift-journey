//
//  Stripes.swift
//  Set Game
//
//  Created by Matthew Trump on 7/22/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

struct Stripes: Shape {
    var width : Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let count = Int(rect.maxX / CGFloat(width))
        for index in 0 ... count+2 {
            let x       = index*(width*2)
            let start   = CGPoint(x:x,y:0)
            let end     = CGPoint(x:CGFloat(x),y:rect.maxY)
            
            path.move(to: start)
            path.addLine(to: end)
        }
        return path
    }
}

