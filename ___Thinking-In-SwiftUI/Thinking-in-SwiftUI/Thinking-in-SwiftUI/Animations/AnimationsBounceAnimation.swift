import SwiftUI

struct Bounce: AnimatableModifier {
    var times: CGFloat = 0
    var amplitude: CGFloat = 30
    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }

    func body(content: Content) -> some View {
        return content.offset(y: -abs(sin(times * .pi)) * amplitude)
    }
}

extension View {
    func bounce(times: Int) -> some View {
        return modifier(Bounce(times: CGFloat(times)))
    }
}

struct AnimationsBounceAnimation: View {
    @State private var taps: Int = 0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.linear(duration: 0.9)) {
                self.taps += 1
            }
        }
        .font(.custom("TTFirsNeue-Bold", size: 24))
        .foregroundColor(Color("purple"))
        .bounce(times: taps * 3)
    }
}

#if DEBUG
struct AnimationsBounceAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsBounceAnimation()
    }
}
#endif
