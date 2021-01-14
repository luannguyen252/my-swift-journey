#if DEBUG

import SwiftUI


extension Binding {

    public static func mock(_ value: Value) -> Self {
        var mockedValue = value

        return Binding(
            get: { mockedValue },
            set: { mockedValue = $0 }
        )
    }
}

#endif
