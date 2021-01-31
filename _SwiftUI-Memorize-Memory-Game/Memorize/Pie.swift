import SwiftUI

struct Pie: Shape {
    let startAngle: Angle
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        
        // path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - 20))
        path.addArc(center: center,
                    radius: rect.width/2,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true
        )
        path.closeSubpath()
        
        return path
    }
}
