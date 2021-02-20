// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// see https://stackoverflow.com/questions/60223711/how-to-set-default-clouse-param-in-view-method/60225784#60225784
extension View {

    func ifLet<Value, Then: View>(
        _ value: Value?,
        then: (Value) -> Then
    ) -> _ConditionalContent<Then, EmptyView> {
        if let value = value {
            return ViewBuilder.buildEither(first: then(value))
        } else {
            return ViewBuilder.buildEither(second: EmptyView())
        }
    }

    func ifLet<Value, Then: View, Else: View>(
        _ value: Value?,
        then: (Value) -> Then,
        else: () -> Else
    ) -> _ConditionalContent<Then, Else> {
        if let value = value {
            return ViewBuilder.buildEither(first: then(value))
        } else {
            return ViewBuilder.buildEither(second: `else`())
        }
    }
}
