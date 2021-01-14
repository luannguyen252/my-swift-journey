import SwiftUI


struct ShapeClipModifier<S: Shape> {
    var shape: S
}


// MARK: - ViewModifier
extension ShapeClipModifier: ViewModifier {

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}
