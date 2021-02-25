import SwiftUI

/// Send Pointer to Device: I/O → Input → Send Pointer to Device

struct HoverEffectExample: View {
    var body: some View {
        Text("Hover Effect")
            .hoverEffect() // .automatic, .highlight, .lift
        
        // Content Shape and Rounded Rectangle
        Text("Hover Effect")
            .padding()
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .hoverEffect() // .automatic, .highlight, .lift
        
        // Button with Hover Effect
        Button(action: {}) {
            Text("Hover Effect")
        }
        .padding()
        .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .hoverEffect() // .automatic, .highlight, .lift
    }
}

// onHover
struct OnHoverExample: View {
    @State var isHover = false
    
    var body: some View {
        Text("Hover Effect")
            .padding()
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .scaleEffect(isHover ? 1.2 : 1)
            .animation(.spring())
            .onHover { hover in
                isHover = hover
            }
    }
}

// Final Code
struct HoverEffectFinalCode: View {
    @State var isHover = false
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Hover Effect")
            }
            .padding()
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .hoverEffect()

            Text("Hover Effect")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .trim(from: isHover ? 0 : 1, to: 1)
                        .stroke(Color.black.opacity(1), lineWidth: 1)
                )
                .scaleEffect(isHover ? 1.2 : 1)
                .animation(.spring())
                .onHover { hover in
                    isHover = hover
                }
        }
    }
}

#if DEBUG
struct HoverEffectExample_Previews: PreviewProvider {
    static var previews: some View {
        HoverEffectExample()
    }
}
#endif
