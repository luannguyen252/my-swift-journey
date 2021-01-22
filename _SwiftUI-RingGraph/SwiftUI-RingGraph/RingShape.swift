//
//  RingShape.swift
//  SwiftUI-RingGraph
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct RingShape: Shape {
    var percent: Double
    var radius: CGFloat = 100
    
    var animatableData: Double{
        get{
            return percent
        }
        
        set{
            percent = newValue
        }
    }

    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Angle(degrees: ( percent / 100 * 360) - 90)
        let radius = width / 2
        
        return Path{ path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: -90.0) , endAngle: endAngle, clockwise: false)
        }
    }
}
