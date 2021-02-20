// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

// https://stackoverflow.com/questions/57021722/swiftui-optional-textfield
func ?? <T>(lhs: Binding<T?>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
