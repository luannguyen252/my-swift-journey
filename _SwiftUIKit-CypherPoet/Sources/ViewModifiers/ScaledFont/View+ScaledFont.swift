import Foundation
import SwiftUI


@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    
    public func scaledFont(for name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
    
}
