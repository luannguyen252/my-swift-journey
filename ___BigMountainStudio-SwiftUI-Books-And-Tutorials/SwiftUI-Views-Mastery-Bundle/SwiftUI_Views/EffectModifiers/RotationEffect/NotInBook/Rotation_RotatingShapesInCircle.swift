//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Rotation_RotatingShapesInCircle: View {
    let shapeCount = 6
        var rotationOffset: Int {
            return Int(360 / shapeCount)
        }
    
    var body: some View {
        VStack {
            HeaderView("Rotation Effect", subtitle: "Rotating Shapes", desc: "By repositioning the anchor, you can rotation views all around it.",
                       back: .clear)
            
            
            GeometryReader { gp in
                GeometryReader { gpInside in
                    Circle()
                        .fill(Color.secondary)
                    
                    ForEach(0...shapeCount-1, id: \.self) { index in
                        Circle()
                            .fill(Color.secondary)
                            .frame(width: 100, height: 100)
                            .overlay(Text("\(index)").rotationEffect(.degrees(-Double(rotationOffset * index))))
                            .frame(width: gpInside.frame(in: .local).midX, height: gpInside.frame(in: .local).midX)
                            .rotationEffect(.degrees(Double(rotationOffset * index)), anchor: .bottomTrailing)
                    }
                    
                    Circle()
                        .frame(width: 15, height: 15)
                        .position(x: gpInside.frame(in: .local).midX,
                                  y: gpInside.frame(in: .local).midY)
                }
                .background(Color.pink)
                .frame(width: gp.size.width, height: gp.size.width)
            }
        }
        .font(.title)
    }
}

struct Rotation_RotatingShapesInCircle_Previews: PreviewProvider {
    static var previews: some View {
        Rotation_RotatingShapesInCircle()
    }
}
