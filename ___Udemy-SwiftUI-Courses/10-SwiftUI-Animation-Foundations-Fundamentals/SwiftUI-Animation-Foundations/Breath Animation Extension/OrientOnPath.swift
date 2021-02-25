import SwiftUI

struct OrientOnPath: View {
    @State var moveOnPath       = false
    @State var swingParentPath  = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("purple"), lineWidth: 1)
                .shadow(color: Color("purple").opacity(0.5), radius: 24, x: 0, y: 0)
                .frame(width: 100, height: 100, alignment: .center)
            
            Circle()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color("pink2"))
                .offset(x: -50)
                .rotationEffect(.degrees(moveOnPath ? 0 : 360))
                .shadow(color: Color("pink2").opacity(0.5), radius: 24, x: 0, y: 0)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear() {
                    moveOnPath.toggle()
                }
        }
        .rotation3DEffect(
            .degrees(70),
            axis: (x: 10, y: swingParentPath ? 2 : -2, z: 0.0))
        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
        .onAppear() {
            swingParentPath.toggle()
        }
    }
}

#if DEBUG
struct OrientOnPath_Previews: PreviewProvider {
    static var previews: some View {
        OrientOnPath()
    }
}
#endif
