//   | @BigMtnStudio

import SwiftUI

struct Triangle: Shape {
    var xOffset: CGFloat = 0.0
    
    var animatableData: CGFloat
    {
        get { return xOffset }
        set { xOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX * xOffset, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Triangle()
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Triangle(xOffset: 0.5)
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Triangle(xOffset: 1)
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
        }
        .foregroundColor(.blue)
    }
}
