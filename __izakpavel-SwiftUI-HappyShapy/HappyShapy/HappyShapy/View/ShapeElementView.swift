//
//  ShapeElementView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct PolygonShape: Shape {
    var corners: Int
    
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let midX = Double(rect.width/2)
            let midY = Double(rect.height/2)
            
            guard corners>0 else {
                return
            }
            
            path.move(to: CGPoint(x: Double(rect.width), y: midY))
            
            for i in 0..<self.corners {
                let angle = Double.pi*2/Double(corners)*Double(i)
                let point = CGPoint(x: midX + midX*cos(angle), y: midY+midY*sin(angle))
                path.addLine(to: point)
            }
            
            path.addLine(to: CGPoint(x: Double(rect.width), y: midY))
        }
    }
}

struct StarShape: Shape {
    var corners: Int
    let innerRadius: Double = 0.66
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let midX = Double(rect.width/2)
            let midY = Double(rect.height/2)
            
            guard corners>0 else {
                return
            }
            
            path.move(to: CGPoint(x: Double(rect.width), y: midY))
            
            for i in 0..<self.corners {
                var angle = Double.pi*2/Double(corners)*Double(i)
                let outerCorner = CGPoint(x: midX + midX*cos(angle), y: midY+midY*sin(angle))
                path.addLine(to: outerCorner)
                
                angle = Double.pi*2/Double(corners)*(Double(i)+0.5)
                let innerCorner = CGPoint(x: midX + midX*cos(angle)*innerRadius, y: midY+midY*sin(angle)*innerRadius)
                path.addLine(to: innerCorner)
            }
            
            path.addLine(to: CGPoint(x: Double(rect.width), y: midY))
        }
    }
}

struct MultiElementShape: Shape {
    var shapeKind: ShapeElementKind
    var cornerRadius: CGFloat
    var corners: Int
    
    init(element: ShapeElement) {
        self.shapeKind = element.kind
        self.cornerRadius = element.cornerRadius
        self.corners = Int(element.corners)
    }
    
    func path(in rect: CGRect) -> Path {
        switch shapeKind {
        case .ellipse:
            return Ellipse().path(in: rect)
        case .rectangle:
            return Rectangle().path(in: rect)
        case .roundedRectangle:
            return RoundedRectangle(cornerRadius: self.cornerRadius).path(in: rect)
        case .polygon:
            return PolygonShape(corners: self.corners).path(in: rect)
        case .star:
            return StarShape(corners: self.corners).path(in: rect)
        }
    }
}

struct ShapeElementView: View {
    @ObservedObject var element: ShapeElement
    var body: some View {
        let stroke = MultiElementShape(element: element)
            .stroke(Color.primary, lineWidth: 2)
        
        return MultiElementShape(element: element)
            .fill(Color("Shape"))
            .overlay(stroke)
            .opacity(element.visible ? 1 : 0)
        // TODO style
    }
}
