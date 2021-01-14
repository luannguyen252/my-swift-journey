import SwiftUI


extension View {
    
    public func embedInScrollView(
        axes: Axis.Set = [.vertical, .horizontal],
        showsIndicators: Bool = true,
        alignment: Alignment = .center
    ) -> some View {
        GeometryReader { geometry in
            ScrollView(axes, showsIndicators: showsIndicators) {
                self.frame(
                    minHeight: geometry.size.height,
                    maxHeight: .infinity,
                    alignment: alignment
                )
            }
        }
    }
}
