import SwiftUI

struct PulsationView: View {
    @State private var isAnimation = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pulsatingFillColor)
                .frame(width: 250, height: 250)
                .scaleEffect(isAnimation ? 1.3 : 1.0)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
                .onAppear {
                    self.isAnimation.toggle()
                }
        }
    }
}
