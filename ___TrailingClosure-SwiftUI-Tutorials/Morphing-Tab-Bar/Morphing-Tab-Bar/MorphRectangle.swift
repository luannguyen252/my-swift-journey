import SwiftUI

struct MorphRectangle: Shape {
    var cornerRadius    : CGFloat
    var dipRadius       : CGFloat
    var tabCount        : Int
    
    var index           : Int
    
    private var indexAsDouble   : Double
    
    init(cornerRadius: CGFloat, dipRadius: CGFloat, tabCount: Int, index: Int) {
        self.cornerRadius   = cornerRadius
        self.dipRadius      = dipRadius
        self.tabCount       = tabCount
        self.index          = index
        
        self.indexAsDouble = Double(index)
    }
    
    var animatableData: Double {
        get { indexAsDouble }
        set { self.indexAsDouble = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Lleading Middle
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        // Top Left Corner
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        let centerX = rect.width / CGFloat(tabCount + tabCount + 1)
        let padding: CGFloat = centerX / 2.0
        
        let leftX = CGFloat(indexAsDouble) * (centerX * 2) + (padding * 2)
        let bottomY: CGFloat = rect.height * (2.0/3.0) + 8
        let dipWidth = centerX * (2.0/3.0)
        
        // Top Left
        path.addLine(to: CGPoint(x: leftX - dipRadius, y: 0))
        
        // ---- Morph Dip ----
        // Top Left Morph
        path.addArc(center: CGPoint(x: leftX - dipRadius, y: dipRadius), radius: dipRadius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360), clockwise: false)
        // Left Side Morph
        path.addLine(to: CGPoint(x: leftX, y: bottomY - dipRadius))
        
        // Bottom Left Morph
        path.addArc(center: CGPoint(x: leftX + dipRadius, y: bottomY - dipRadius), radius: dipRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        
        // Bottom Side Morph
        path.addLine(to: CGPoint(x: leftX + dipWidth - dipRadius, y: bottomY))
        
        // Right Bottom Morph
        path.addArc(center: CGPoint(x: leftX + dipWidth, y: bottomY - dipRadius), radius: dipRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        // Right Side Morph
        path.addLine(to: CGPoint(x: leftX + dipWidth + dipRadius, y: 0 + dipRadius))
        
        // Top Right Morph
        path.addArc(center: CGPoint(x: leftX + dipWidth + (dipRadius * 2), y: 0 + dipRadius), radius: dipRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        // Top Right
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
        
        // Right Corner
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360), clockwise: false)
        
        // Right to Bottom Corner
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: rect.height - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 360), endAngle: Angle(degrees: 450), clockwise: false)
        
        // Bottom to Left Corner
        path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
        path.addArc(center: CGPoint(x: cornerRadius, y: rect.height - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 450), endAngle: Angle(degrees: 540), clockwise: false)
        
        path.closeSubpath()
        
        return path
    }
}
