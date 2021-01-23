import SwiftUI

// Make it so we can detect touch down not just tap up.
struct TouchGestureViewModifier: ViewModifier {
    let touchBegan: () -> Void
    let touchEnd: (Bool) -> Void
    let abort: (Bool) -> Void

    @State private var hasBegun = false
    @State private var hasEnded = false
    @State private var hasAborted = false

    private func isTooFar(_ translation: CGSize) -> Bool {
        let distance = sqrt(pow(translation.width, 2) + pow(translation.height, 2))
        return distance >= 20.0
    }

    func body(content: Content) -> some View {
        content.gesture(DragGesture(minimumDistance: 0)
                .onChanged { event in
                    guard !self.hasEnded else { return }

                    if self.hasBegun == false {
                        self.hasBegun = true
                        self.touchBegan()
                    } else if self.isTooFar(event.translation) {
                        self.hasAborted = true
                        self.abort(true)
                    }
                }
                .onEnded { event in
                    print("ended")
                    if !self.hasEnded {
                        if self.isTooFar(event.translation) {
                            self.hasAborted = true
                            self.abort(true)
                        } else {
                            self.hasEnded = true
                            self.touchEnd(true)
                        }
                    }
                    self.hasBegun = false
                    self.hasEnded = false
                })
    }
}

// Add above so we can use it
extension View {
    func onTouchGesture(touchBegan: @escaping () -> Void = {},
                        touchEnd: @escaping (Bool) -> Void = { _ in },
                        abort: @escaping (Bool) -> Void = { _ in }) -> some View {
        modifier(TouchGestureViewModifier(touchBegan: touchBegan, touchEnd: touchEnd, abort: abort))
    }
}
