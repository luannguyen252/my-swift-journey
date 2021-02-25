import SwiftUI

struct AnimateObjectRotation: View {
    @State var rotation = 0.0
    
    var body: some View {
        Rectangle()
            .fill(Color("orange"))
            .frame(width: 50, height: 50, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4))
            .onAppear() {
                rotation += 360
            }
    }
}

struct AnimateObjectRotation_Previews: PreviewProvider {
    static var previews: some View {
        AnimateObjectRotation()
    }
}
