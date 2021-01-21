import SwiftUI

extension View {
    func addGravityMoving() -> some View {
        self.modifier(GravityMovingModifier())
    }
}

struct GravityMovingModifier: ViewModifier {
    private var timer = Timer.publish(every: 1, on: RunLoop.main, in: .default).autoconnect()
    @State private var value: CGSize = .zero
    
    private func randomOffset() -> CGSize {
        let items = Array(-20...20)
        let x = items.randomElement() ?? 0
        let y = items.randomElement() ?? 0
        return CGSize(width: CGFloat(x), height: CGFloat(y))
    }
    
    func body(content: Content) -> some View {
        content
            .modifier(GravityMovingEffect(offset: value))
            .onReceive(timer) { _ in
                withAnimation(Animation.easeInOut(duration: 2)) {
                    self.value = self.randomOffset()
                }
        }
    }
}

struct GravityMovingEffect: GeometryEffect {
    var offset: CGSize
    
    var animatableData: CGSize.AnimatableData {
        get { CGSize.AnimatableData(offset.width, offset.height) }
        set { offset = CGSize(width: newValue.first, height: newValue.second) }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: offset.width, y: offset.height))
    }
}
