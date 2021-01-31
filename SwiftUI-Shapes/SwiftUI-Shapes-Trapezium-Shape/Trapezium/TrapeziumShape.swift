//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct TrapeziumShape: Shape {
    var offset: CGFloat = 0.75
    var corner: UIRectCorner = .bottomLeft
    
    var animatableData: CGFloat {
        get { return offset }
        set { offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Start point - Top Left
        path.move(to: CGPoint(x: 0, y: corner == .topLeft ? rect.maxY * offset : 0))
        // Top Right
        path.addLine(to: CGPoint(x: rect.maxX, y: corner == .topRight ? rect.maxY * offset : 0))
        // Bottom Right
        path.addLine(to: CGPoint(x: rect.maxX, y: corner == .bottomRight ? rect.maxY * offset : rect.maxY))
        
        path.addLine(to: CGPoint(x: 0, y: corner == .bottomLeft ? rect.maxY * offset : rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct TrapeziumShape_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumShape()
    }
}
