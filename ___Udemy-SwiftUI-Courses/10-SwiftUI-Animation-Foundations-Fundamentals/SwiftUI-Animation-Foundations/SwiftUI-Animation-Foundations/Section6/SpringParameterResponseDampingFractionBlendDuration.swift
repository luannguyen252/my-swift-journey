import SwiftUI

struct SpringParameterResponseDampingFractionBlendDuration: View {
    @State private var moveBall = false
    
    var body: some View {
        VStack {
            Text("Understanding Spring Animation Parameters")
                .font(.largeTitle)
            
            Spacer()
            
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "down"))
                
                Image(uiImage: #imageLiteral(resourceName: "ball"))
                    .offset(y: moveBall ? 0 : 30)
                    .animation(Animation.spring(response: 0.56, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: false))
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

struct SpringParameterResponseDampingFractionBlendDuration_Previews: PreviewProvider {
    static var previews: some View {
        SpringParameterResponseDampingFractionBlendDuration()
    }
}
