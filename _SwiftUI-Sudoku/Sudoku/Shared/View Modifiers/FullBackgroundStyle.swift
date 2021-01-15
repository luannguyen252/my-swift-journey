import SwiftUI

/// Used for customizing the background color extending over safe area insets.
struct FullBackgroundStyle: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

extension View {
    /// Used for customizing the background color extending over safe area insets.
    func fullBackgroundStyle(_ color: Color = Color("dynamicBackground")) -> some View {
        self.modifier(FullBackgroundStyle(color: color))
    }
}
