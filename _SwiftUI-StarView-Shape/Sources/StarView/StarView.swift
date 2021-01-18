
import SwiftUI

public struct StarView: Animatable, View {
    
    public struct Style {
        public let fillColor: Color
        public let lineWidth: CGFloat
        public let borderColor: Color
        public let starExtrusion: CGFloat
        
        public init(
            fillColor: Color = .starYellow,
            borderColor: Color = .starYellow,
            borderWidth: CGFloat = 4,
            starExtrusion: CGFloat = 20
        ) {
            self.fillColor = fillColor
            self.borderColor = borderColor
            self.lineWidth = borderWidth
            self.starExtrusion = starExtrusion
        }
    }
    
    private let style: Style
    private var fillPercentage: CGFloat
    
    public var animatableData: Double {
        get {
            return Double(fillPercentage)
        }
        set {
            fillPercentage = CGFloat(newValue)
        }
    }
    
    public init(percentage: CGFloat, style: Style = .init()) {
        self.fillPercentage = percentage
        self.style = style
    }
        
    private func needsToBeFilledWidth(totalWidth: CGFloat) -> CGFloat {
        return totalWidth * (100 - fillPercentage) / 100
    }
    
    public var body: some View {
        GeometryReader { geometry in
            StarShape(starExtrusion: self.style.starExtrusion)
                .stroke(self.style.borderColor, lineWidth: self.style.lineWidth)
                .overlay(
                    Rectangle()
                        .foregroundColor(self.style.fillColor)
                        .offset(x: -self.needsToBeFilledWidth(totalWidth: geometry.size.width))
                        .clipShape(
                            StarShape(starExtrusion: self.style.starExtrusion)
                        )
                )
                
        }
    }
    
}
