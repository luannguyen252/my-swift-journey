// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// Using a DragGesture to move a view horizontally
/// see https://stackoverflow.com/questions/57020557/why-doesnt-this-swiftui-view-animate
struct DragGestureView: View {

    @GestureState var dragOffset = CGSize.zero
    @State var offset: CGFloat = 0

    var dragGesture: some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation
            }
            .onEnded { gesture in
                // keep the offset already moved without animation
                self.offset += gesture.translation.height
                withAnimation(Animation.easeOut(duration: 3)) {
                    self.offset += gesture.predictedEndTranslation.height - gesture.translation.height
                }
            }
    }

    var body: some View {
        VStack {
            ForEach(1 ..< 5) { _ in
                Color.red
                    .frame(minHeight: 20, maxHeight: 100)
            }
        }
        .offset(x: 0, y: offset + dragOffset.height)
        .gesture(dragGesture)
    }

}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
