import SwiftUI


extension Group where Content: View {
    
    /// Dynamically embeds the content of a `Group` in a `VStack` or an `HStack`.
    ///
    /// Content will be embedded in a `VStack` if:
    ///   * The current value of `Environment.sizeCategory` lies within the
    ///     specified `compactableContentSizes.`
    ///   * The current value of `Environment.horizontalSizeClass`matches `.compact`
    ///
    /// Otherwise, content will be embedded in an `HStack`.
    public func embedInCompactableStack(
        compactableContentSizes: [ContentSizeCategory] = EmbedInCompactableStack.defaultVerticalSizes
    ) -> some View {
        ModifiedContent(
            content: self,
            modifier: EmbedInCompactableStack(compactableContentSizes: compactableContentSizes)
        )
    }
}
