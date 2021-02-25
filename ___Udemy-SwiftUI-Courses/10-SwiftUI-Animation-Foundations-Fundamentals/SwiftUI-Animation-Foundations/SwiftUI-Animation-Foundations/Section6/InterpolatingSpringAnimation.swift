import SwiftUI

struct InterpolatingSpringAnimation: View {
    @State var rotateBell = false
    
    var body: some View {
        ZStack {
            Image(systemName: "bell.fill")
                .font(.system(size: 120))
                .rotationEffect(.degrees(rotateBell ? -45 : 45), anchor: .top)
                .animation(Animation.interpolatingSpring(mass: 10, stiffness: 170, damping: 5, initialVelocity: 0).repeatForever(autoreverses: true).speed(2))
                .onAppear() {
                    rotateBell.toggle()
                }
        }
    }
}

#if DEBUG
struct InterpolatingSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        InterpolatingSpringAnimation()
    }
}
#endif
