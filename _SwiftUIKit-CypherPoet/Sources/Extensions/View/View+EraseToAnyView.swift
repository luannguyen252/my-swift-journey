import SwiftUI


// ⚠️ NOTE: When possible, use `Group` instead of `AnyView`.
//
// AnyView allows changing the type of view used in a given view hierarchy.
// Whenever the type of view used with AnyView changes,
// SwiftUI destroys old hierarchy and creates a new hierarchy the new type.

extension View {
    
    public func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
