import SwiftUI


public struct EmbedInCompactableStack {
    public static let defaultVerticalSizes: [ContentSizeCategory] = [
        .accessibilityLarge,
        .accessibilityExtraLarge,
        .accessibilityExtraExtraLarge,
        .accessibilityExtraExtraExtraLarge,
    ]
    
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    
    private let compactableContentSizes: [ContentSizeCategory]
    
    
    init(
        compactableContentSizes: [ContentSizeCategory] = Self.defaultVerticalSizes
    ) {
        self.compactableContentSizes = compactableContentSizes
    }
}


extension EmbedInCompactableStack {
    var isVerticallyStacked: Bool {
        horizontalSizeClass == .compact ||
        compactableContentSizes.contains(sizeCategory)
    }
}


// MARK: - ViewModifier
extension EmbedInCompactableStack: ViewModifier {
    
    public func body(content: Content) -> some View {
        isVerticallyStacked ?
            AnyView(VStack { content })
            : AnyView(HStack { content })
    }
}
