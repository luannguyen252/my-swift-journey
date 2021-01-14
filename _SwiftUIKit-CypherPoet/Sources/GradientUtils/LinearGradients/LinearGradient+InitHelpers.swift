import SwiftUI


extension LinearGradient {

    public init(
        _ colors: Color...,
        from startPoint: UnitPoint = .topLeading,
        to endPoint: UnitPoint = .bottomTrailing
    ) {
        self.init(
            gradient: Gradient(colors: colors),
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
}
