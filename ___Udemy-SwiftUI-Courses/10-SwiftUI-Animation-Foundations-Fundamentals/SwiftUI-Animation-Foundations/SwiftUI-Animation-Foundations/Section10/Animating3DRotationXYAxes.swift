import SwiftUI

struct Animating3DRotationXYAxes: View {
    @State var moveOnPath       = false
    @State var swingParentPath  = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 1/3, to: 2/3)
                .stroke(lineWidth: 4)
                .frame(width: 100, height: 100, alignment: .center)
            
            Circle()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(.blue)
                .offset(x: -50)
                .rotationEffect(.degrees(moveOnPath ? 0 : 360))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear() {
                    moveOnPath.toggle()
                }
               
        }
        .rotation3DEffect(
            .degrees(70),
            axis: (x: swingParentPath ? 20 : -2, y: swingParentPath ? 2 : -2, z: 0.0))
        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
        .onAppear() {
            swingParentPath.toggle()
        }
    }
}

struct Animating3DRotationXYAxes_Previews: PreviewProvider {
    static var previews: some View {
        Animating3DRotationXYAxes()
    }
}
