import Foundation
import SwiftUI


public struct ScaledSystemFont: ViewModifier {
    
    /// The `ScaledFont` struct won't actually use this. But watching it here lets
    /// the system know that it needs to reload the `body` view when changes occur.
    @Environment(\.sizeCategory) var sizeCategory
    
    
    public var size: CGFloat
    public var weight: Font.Weight
    public var design: Font.Design

    
    public init(
        size: CGFloat,
        weight: Font.Weight = .regular,
        design: Font.Design = .default
    ) {
        self.size = size
        self.weight = weight
        self.design = design
    }
    
    
    public func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        
        return content.font(.system(size: scaledSize, weight: weight, design: design))
    }
}
