import SwiftUI

struct BouncingAnimation: View {
    @State var bounce = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Image(systemName: "swift")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                
                Image(systemName: "swift")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                    .offset(y: bounce ? 0 : -120)
                    .animation(Animation.interpolatingSpring(stiffness: 700, damping: 15, initialVelocity: 0).repeatForever(autoreverses: false))
                    .onAppear() {
                        bounce.toggle()
                    }
                
                Image(systemName: "swift")
                    .font(.system(size: 40))
                    .foregroundColor(.green)
                
                Image(systemName: "swift")
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
            }
        }
        .padding()
    }
}

struct BouncingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BouncingAnimation()
    }
}
