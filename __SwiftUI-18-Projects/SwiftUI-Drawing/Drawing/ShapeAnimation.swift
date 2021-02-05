//
//  ShapeAnimation.swift
//  Drawing
//
//  Created by Sandesh on 03/06/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI
/*
 animatableData :- is the data that is applied to the property of that is bring aimnated it gets called whenever the main view is animatable and the underlying shape need to animate accordingly. It is defined in ShapeAnimation struct
 */
struct ShapeAnimation: View {
    @State private var insetAmount: CGFloat = 50

    var body: some View {
        Trapzoid(insetAmount: insetAmount)
            .frame(width: 400, height: 400, alignment: .center)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 50 ... 100)
                }
                
        }
    }
}

struct Trapzoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct ShapeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ShapeAnimation()
    }
}
