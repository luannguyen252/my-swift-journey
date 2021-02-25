import SwiftUI

struct AnimateObjectTransparency: View {
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State var positionX = -150
    @State var objectColor = Color("orange")
    @State var transparency = 0.2
    
    var body: some View {
        Rectangle()
            .fill(objectColor)
            .frame(width: 50, height: 50, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .offset(x: CGFloat(positionX))
            .opacity(transparency)
            .scaleEffect(CGFloat(scaleXY))
            .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4))
            .onAppear() {
                rotation += 360
                scaleXY += 1.1
                positionX += 250
                objectColor = Color("pink2")
                transparency = 1
            }
    }
}

struct AnimateObjectTransparency_Previews: PreviewProvider {
    static var previews: some View {
        AnimateObjectTransparency()
    }
}
