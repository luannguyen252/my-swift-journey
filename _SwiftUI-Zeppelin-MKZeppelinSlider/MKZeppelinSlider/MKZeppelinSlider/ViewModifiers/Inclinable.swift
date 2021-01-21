import SwiftUI

enum InclineDirection: Double {
    case none = 0
    case leading = -30
    case trailing = 30
}

extension View {

    func incline(direction: InclineDirection) -> some View {
        ModifiedContent(content: self, modifier: InclineEffect(inclineDirection: direction))
    }
}

struct InclineEffect: GeometryEffect {

    var degrees: Double
    var animationValue: Double

    init(inclineDirection: InclineDirection) {
        degrees = inclineDirection.rawValue
        animationValue = inclineDirection == .leading ? 1 : 0
    }

    var animatableData: Double {
        get { animationValue }
        set { animationValue = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle = degrees * sin(animationValue * (.pi / 2.0))

        let affineTransform = CGAffineTransform(translationX: size.width*0.5, y: size.height*0.5)
            .rotated(by: CGFloat(angle))
            .translatedBy(x: -size.width*0.5, y: -size.height*0.5)

        return ProjectionTransform(affineTransform)
    }
}
