import SwiftUI

struct AspectFit: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
    }
}

