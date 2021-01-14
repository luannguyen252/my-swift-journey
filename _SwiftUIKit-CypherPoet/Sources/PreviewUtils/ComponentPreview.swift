#if DEBUG

import SwiftUI


public struct ComponentPreview<Component: View> {
    public var component: Component
    public var displayName: String?
}


// MARK: - View
extension ComponentPreview: View {
    public var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            ForEach(ContentSizeCategory.smallestAndLargest, id: \.self) { category in
                self.component
                    .previewLayout(.sizeThatFits)
                    .background(Color(UIColor.systemBackground))
                    .colorScheme(scheme)
                    .environment(\.sizeCategory, category)
                    .previewDisplayName(
                        displayName ?? "\(scheme.previewName) + \(category.previewName)"
                    )
            }
        }
    }
}


extension View {

    public func previewAsComponent(
        displayName: String?
    ) -> some View {
        ComponentPreview(
            component: self,
            displayName: displayName
        )
    }
}

#endif
