import SwiftUI


extension View {

    public func shapeClipModifier<S: Shape>(
        shape: S
    ) -> some View {
        self.modifier(
            ShapeClipModifier(
                shape: shape
            )
        )
    }

}

