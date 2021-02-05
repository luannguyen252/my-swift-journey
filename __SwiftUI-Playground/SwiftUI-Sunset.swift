import SwiftUI
import PlaygroundSupport

struct Sunset: View {
    @State var backgroundColor = Color.blue 
    @State var sunSetted = false
    let sunGradient = [Color.yellow, Color.orange]
    let moonGradient = [Color.gray, Color.black]
    @State var alignment = Alignment.top
    
    var body: some View {
        ZStack(alignment: alignment) {
            ZStack {
                Sun(gradient: sunGradient)
                Sun(gradient: moonGradient)
                .opacity(self.sunSetted ? 1 : 0)
            }
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Blur(style: .systemUltraThinMaterial)
                        .frame(height: geometry.size.height / 2)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(24)
        .onAppear {
            withAnimation(Animation.linear(duration: 12).repeatForever(autoreverses: true)) {
                self.sunset()
            }
        }
    }
    
    func sunset() {
        backgroundColor = .black
        sunSetted = true
        alignment = .bottom
    }
}

struct Sun: View {
    @State var gradient: [Color]
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom)
        )
            .frame(width: 192, height: 192)
            .padding()
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

PlaygroundPage.current.setLiveView(Sunset())