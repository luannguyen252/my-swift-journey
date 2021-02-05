import SwiftUI

struct CardView: View {
    let color: Color
    let image: Image
    let isFacedUp: Bool
    let accessibilityIdentifier: String
    let accessibilityFaceDownText: Text
    let accessibilityFaceUpText: Text
    var action: () -> Void = { }
    private static let turnCardAnimationDuration: Double = 2/5

    var body: some View {
        ZStack {
            if !isFacedUp {
                Button(action: action) {
                    color.transition(turnTransition)
                }
                .buttonStyle(PlainButtonStyle())
                .accessibility(label: accessibilityFaceDownText)
                .accessibility(identifier: accessibilityIdentifier)
            } else {
                image
                    .renderingMode(.original)
                    .resizable()
                    .font(.largeTitle)
                    .transition(turnTransition)
                    .accessibility(label: accessibilityFaceUpText)
            }
        }
        .modifier(AddCardStyle(foregroundColor: color))
        .rotation3DEffect(
            isFacedUp
                ? .radians(.pi)
                : .zero,
            axis: (x: 0.0, y: 1.0, z: 0.0),
            perspective: 1/3
        )
        .animation(.easeInOut(duration: Self.turnCardAnimationDuration))
        .rotation3DEffect(.radians(.pi), axis: (x: 0.0, y: 1.0, z: 0.0))
    }

    private var turnTransition: AnyTransition {
        AnyTransition.opacity.animation(
            Animation
                .linear(duration: 0.01)
                .delay(Self.turnCardAnimationDuration/2)
        )
    }
}
