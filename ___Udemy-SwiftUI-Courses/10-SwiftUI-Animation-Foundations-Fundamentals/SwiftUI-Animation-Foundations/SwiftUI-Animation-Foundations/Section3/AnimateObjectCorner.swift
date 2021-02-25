import SwiftUI

struct AnimateObjectCorner: View {
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State var positionX = -150
    @State var objectColor = Color("orange")
    @State var transparency = 0.2
    @State var roundCorner = 25
    
    var body: some View {
        RoundedRectangle(cornerRadius: CGFloat(roundCorner))
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
                roundCorner = 0
            }
    }
}

struct AnimateObjectCorner_Previews: PreviewProvider {
    static var previews: some View {
        AnimateObjectCorner()
    }
}
