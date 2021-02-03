import SwiftUI

/// Extend `ViewBuilder` to be able to build more than 10 view.
struct ViewBuilder_extension: View {
    
    var body: some View {
        VStack {
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
            Text("6")
            Text("7")
            Text("8")
            Text("9")
            Text("10")
            Text("11")
            Text("12")
            Text("13")
            Text("14")
            Text("15")
        }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {
    /// `ViewBuilder` extension to build TupleView with 11 child view (using `TupleView` only).
    public static func buildBlockUsingTupleViewOnly<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10>
    // Parameters.
        (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10)
    // Return type.
        -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10)>
    // Type constraints.
        where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View
    // Function body.
    { .init((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)) }
        
    /// `ViewBuilder` extension to build TupleView with 11 child view (using `Group` as well).
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10>
    // Parameters.
        (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10)
    // Return type.
        -> TupleView<
            (
                Group<TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>>,
                C10
            )
        >
    // Type constraints.
        where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View
    // Function body.
    {
        TupleView(
            (
                Group { TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)) },
                c10
            )
        )
    }
}

extension ViewBuilder {
    /// `ViewBuilder` extension to build TupleView with 15 child view (using `TupleView` only).
    public static func buildBlockUsingTupleViewOnly<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14>
    // Parameters.
        (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14)
    // Return type.
        -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14)>
    // Type constraints.
        where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View, C11: View, C12: View, C13: View, C14: View
    // Function body.
    {
        TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14))
    }
    
    /// `ViewBuilder` extension to build TupleView with 15 child view (using `Group` as well).
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14>
    // Parameters.
        (_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14)
    // Return type.
        -> TupleView<
            (
                Group<TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>>,
                Group<TupleView<(C10, C11, C12, C13, C14)>>
            )
        >
    // Type constraints.
        where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View, C10: View, C11: View, C12: View, C13: View, C14: View
    // Function body.
    {
        TupleView(
            (
                Group { TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)) },
                Group { TupleView((c10, c11, c12, c13, c14)) }
            )
        )
    }
}

#if DEBUG
struct ViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewBuilder_extension()
                .previewDisplayName("ViewBuilder_extension")
        }
    }
}
#endif
