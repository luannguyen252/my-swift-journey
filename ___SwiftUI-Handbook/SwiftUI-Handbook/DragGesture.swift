import SwiftUI

/// Gesture Modifier
/// .gesture(
///    DragGesture()
///        .onChanged { value in
///            viewState = value.translation
///    }
/// )

/// CGSize State
/// @State var viewState = CGSize.zero

/// Position Values
/// .offset(x: viewState.width, y: viewState.height)

/// Reset Position on Release
/// DragGesture()
/// .onEnded { value in
///    self.viewState = .zero
/// }

/// With Animation
/// DragGesture()
/// .onEnded { value in
///    withAnimation(.spring()) {
///        viewState = .zero
///    }
/// }

struct DragGesture: View {
    /// @State var viewState = CGSize.zero
    @State private var rectPosition = CGPoint(x: 50, y: 50)
    
    var body: some View {
        Text("Drag Gesture")
            .padding()
//        RoundedRectangle(cornerRadius: 30)
//            .fill(Color.blue)
//            .frame(width: 300, height: 400)
//            .offset(x: viewState.width, y: viewState.height)
//            .gesture(
//                DragGesture().onChanged { value in
//                    viewState = value.translation
//                }
//                .onEnded { value in
//                    withAnimation(.spring()) {
//                        viewState = .zero
//                    }
//                })
    }
}

#if DEBUG
struct DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture()
    }
}
#endif
