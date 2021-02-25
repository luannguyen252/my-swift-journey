import SwiftUI

struct AnimateObjectMove: View {
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State var positionX = -150
    
    var body: some View {
        Rectangle()
            .fill(Color("orange"))
            .frame(width: 50, height: 50, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .offset(x: CGFloat(positionX))
            .scaleEffect(CGFloat(scaleXY))
            .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4))
            .onAppear() {
                rotation += 360
                scaleXY += 1.1
                positionX += 250
            }
    }
}

struct AnimateObjectMove_Previews: PreviewProvider {
    static var previews: some View {
        AnimateObjectMove()
    }
}
