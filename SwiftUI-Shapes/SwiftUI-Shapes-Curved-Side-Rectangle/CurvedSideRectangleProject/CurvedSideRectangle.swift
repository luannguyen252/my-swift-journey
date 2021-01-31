//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct CurvedSideRectangle: Shape {
    var topOffset: CGFloat = 0
    var bottomOffset: CGFloat = 50
    
    var animatableData: CGFloat {
        get { return bottomOffset }
        set { bottomOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + topOffset))
        // path.addLine(to: CGPoint(x: rect.maxX, y: 0)) // Original straight top line
        
        // Top Curve
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + topOffset),
                          control: CGPoint(x: rect.midX, y: rect.minY - topOffset))
        // Trailing Side
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomOffset))
        
        // Bottom Curve
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - bottomOffset),
                          control: CGPoint(x: rect.midX, y: rect.maxY + bottomOffset))
        // Leading Side
        path.closeSubpath()
        
        return path
    }
}

struct CurvedSideRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangle()
            .frame(height: 300)
//            .preferredColorScheme(.dark)
    }
}
