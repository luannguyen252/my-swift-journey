//
//  Diamond.swift
//  Set Game
//
//  Created by Matthew Trump on 7/17/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI


struct Diamond : Shape {
    
    func path(in rect: CGRect)-> Path{
        let left    = CGPoint(x:  rect.minX, y: rect.midY)
        let top     = CGPoint(x:  rect.midX, y: rect.minX)
        let right   = CGPoint(x:  rect.maxX, y: rect.midY)
        let bottom  = CGPoint(x:  rect.midX, y: rect.maxY)
        
        var p = Path()
        p.move(to: left)
        p.addLine(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: left)
        
        return p
    }
    
}
