import SwiftUI

struct MassSpringAnimation: View {
    @State private var moveBall = false
    
    var body: some View {
        VStack {
            Spacer()

            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "down"))
                
                Image(uiImage: #imageLiteral(resourceName: "ball"))
                    .offset(y: moveBall ? 0 : 30)
                    .animation(Animation.interpolatingSpring(mass: 1, stiffness: 200, damping: 5, initialVelocity: 4).repeatForever(autoreverses: false))
                    .onAppear() {
                        moveBall.toggle()
                    }

                Image(uiImage: #imageLiteral(resourceName: "top"))
                    .offset(x: 3)
            }
            .scaleEffect(2)

            Spacer()
        }
    }
}

struct MassSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MassSpringAnimation()
    }
}
