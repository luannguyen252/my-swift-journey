import Foundation
import SwiftUI


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension Text {
    
    public func scaledSystemFont(
        size: CGFloat,
        weight: Font.Weight = .regular,
        design: Font.Design = .default
    ) -> some View {
        self.modifier(ScaledSystemFont(size: size, weight: weight, design: design))
    }
}
