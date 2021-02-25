import SwiftUI

struct WaveMaskExample: View {
    @State var index: Int = 0
    
    var images: [Image] = [
        Image("mac1"),
        Image("mac2"),
        Image("mac3"),
        Image("mac4"),
        Image("mac5"),
        Image("mac6"),
        Image("mac7"),
        Image("mac8"),
        Image("mac9"),
    ]
    
    var body: some View {
        ZStack {
            ForEach(images.indices) { i in
                if i == index {
                    images[index]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .transition(.waveMask)
                }
            }
        }
        .onTapGesture {
            withAnimation(.easeOut(duration: 3)) {
                index = (index + 1) % images.count
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

// Using the Wave as a Mask
struct WaveMaskModifier: AnimatableModifier {
    var pct: CGFloat
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .mask(
                GeometryReader { geo in
                    VStack {
                        Spacer()
                        ZStack {
                            Wave(waveHeight: 30, phase: Angle(degrees: (Double(pct) * 720 * -1) + 45))
                                .opacity(0.5)
                                .scaleEffect(x: 1.0, y: 1.2, anchor: .center)
                                .offset(x: 0, y: 30)
                            Wave(waveHeight: 30, phase: Angle(degrees: Double(pct) * 720))
                                .scaleEffect(x: 1.0, y: 1.2, anchor: .center)
                                .offset(x: 0, y: 30)
                        }
                        .frame(height: geo.size.height * pct, alignment: .bottom)
                    }
                    
                }
            )
    }
}

// WaveMaskModifier as a Transition
extension AnyTransition {
    static let waveMask = AnyTransition.asymmetric(insertion:
        AnyTransition.modifier(active: WaveMaskModifier(pct: 0), identity: WaveMaskModifier(pct: 1)), removal: .scale(scale: 1.1)
    )
}

#if DEBUG
struct WaveMaskExample_Previews: PreviewProvider {
    static var previews: some View {
        WaveMaskExample()
    }
}
#endif
