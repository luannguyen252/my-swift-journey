import SwiftUI
import Lottie

// Lottie View
struct LottieView: UIViewRepresentable {
    var name = "HalloweenSmoothymon"
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}

struct LottieAnimation: View {
    var body: some View {
        LottieView(name: "GhostsToHalloween", loopMode: .loop)
    }
}

#if DEBUG
struct LottieAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LottieAnimation()
    }
}
#endif
