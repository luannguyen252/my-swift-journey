import SwiftUI

struct AnimateObjectScale: View {
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    
    var body: some View {
        Rectangle()
            .fill(Color("orange"))
            .frame(width: 50, height: 50, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .scaleEffect(CGFloat(scaleXY))
            .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4))
            .onAppear() {
                rotation += 360
                scaleXY += 1.1
            }
    }
}

struct AnimateObjectScale_Previews: PreviewProvider {
    static var previews: some View {
        AnimateObjectScale()
    }
}
