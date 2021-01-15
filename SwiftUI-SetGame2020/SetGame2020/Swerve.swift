//
//  Swerve.swift
//  Set Game
//
//  Created by Matthew Trump on 7/19/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

//
//  Diamond.swift
//  Set Game
//
//  Created by Matthew Trump on 7/17/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI


struct Swerve: Shape {
    
    func path(in rect: CGRect)-> Path{
        
        let width  = rect.maxX - rect.minX
        let height = rect.maxY - rect.minY
        
        let bottomLeft      = CGPoint(x:  rect.minX + width*indentFactor,       y: rect.maxY-yIndentFactor*height)
        let topLeft         = CGPoint(x:  rect.minX + width*doubleIndentFactor, y: rect.minY+yIndentFactor*height)
        let topRight        = CGPoint(x:  rect.maxX - width*indentFactor,       y: rect.minY+yIndentFactor*height)
        let bottomRight     = CGPoint(x:  rect.maxX - width*doubleIndentFactor, y: rect.maxY-yIndentFactor*height)
        
        let controlTopTop       = CGPoint(x: topLeft.x+(topRight.x-topLeft.x)/(2.6), y:topLeft.y-yControlOffset*height)
        let controlTopBottom    = CGPoint(x: topLeft.x+(topRight.x-topLeft.x)/(2.6), y:topLeft.y+yControlOffset*height)
        
        let controlBottomTop       = CGPoint(x: bottomLeft.x+(bottomRight.x-bottomLeft.x)/(1.6), y:bottomLeft.y-yControlOffset*height)
        let controlBottomBottom    = CGPoint(x: bottomLeft.x+(bottomRight.x-bottomLeft.x)/(1.6), y:bottomLeft.y+yControlOffset*height)
        
        var p = Path()
        p.move(to: bottomLeft)
        p.addLine(to: topLeft)
        p.addCurve(to: topRight,control1: controlTopBottom,control2:controlTopTop )
        p.addLine(to: bottomRight)
        p.addCurve(to: bottomLeft,control1:controlBottomTop,control2:controlBottomBottom )

        return p
    }
    private let indentFactor : CGFloat = 0.05
    private let doubleIndentFactor : CGFloat = 0.2
    private let yIndentFactor : CGFloat = 0.2
    private let yControlOffset: CGFloat = 0.3
}

