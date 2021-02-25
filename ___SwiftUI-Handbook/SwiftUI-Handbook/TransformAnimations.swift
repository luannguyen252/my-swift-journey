import SwiftUI

struct TransformAnimations: View {
    // Animation States
    @State var show = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 300, height: 200)
            // Offset
            .offset(y: show ? -200 : 0)
            // Scale
            .scaleEffect(show ? 1.2 : 1)
            // Rotate
            .rotationEffect(.degrees(show ? 90 : -90))
            // 3D Animation
            .rotation3DEffect(
                Angle(degrees: show ? 30 : 0),
                axis: (x: 1, y: 0, z: 0),
                anchor: .center,
                anchorZ: 0.0,
                perspective: 1
            )
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
    }
}

// Final Layout
struct TransformAnimationsFinalLayout: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 260, height: 200)
                .offset(y: 20)
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 200)
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .offset(y: show ? -200 : 0)
                .scaleEffect(show ? 1.2 : 1)
                .rotationEffect(Angle(degrees: show ? 30 : 0))
                .rotation3DEffect(
                    Angle(degrees: show ? 30 : 0),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
        }
    }
}

#if DEBUG
struct TransformAnimations_Previews: PreviewProvider {
    static var previews: some View {
        TransformAnimations()
    }
}
#endif
