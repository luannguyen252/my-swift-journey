import SwiftUI

struct InteractiveSpringAnimation: View {
    @State var rotateBell = false
    
    var body: some View {
        ZStack {
            Image(systemName: "bell.fill")
                .font(.system(size: 120))
                .rotationEffect(.degrees(rotateBell ? -45 : 45), anchor: .top)
                .animation(Animation.interactiveSpring().repeatForever(autoreverses: true).speed(1))
                .onAppear() {
                    rotateBell.toggle()
                }
        }
    }
}

#if DEBUG
struct InteractiveSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveSpringAnimation()
    }
}
#endif
