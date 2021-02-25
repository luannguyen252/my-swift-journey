import SwiftUI

struct SpringAnimation: View {
    @State var rotateBell = false
    
    var body: some View {
        ZStack {
            Image(systemName: "bell.fill")
                .font(.system(size: 120))
                .rotationEffect(.degrees(rotateBell ? -45 : 45), anchor: .top)
                 .animation(Animation.spring().repeatForever(autoreverses: true).speed(1))
                .onAppear() {
                    rotateBell.toggle()
                }
        }
    }
}

#if DEBUG
struct SpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimation()
    }
}
#endif
