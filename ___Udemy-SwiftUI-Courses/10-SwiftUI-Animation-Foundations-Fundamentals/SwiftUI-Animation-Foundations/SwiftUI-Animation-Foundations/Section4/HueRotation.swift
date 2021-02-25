import SwiftUI

struct HueRotation: View {
    @State private var offsetCopies = false
    @State private var hueAdjust    = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all, edges: .all)
            
            ZStack {
                ForEach(0..<6) {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(Capsule())
                        .frame(width: 90, height: 60)
                        .opacity(0.5)
                        .blendMode(.hardLight)
                        .offset(x: offsetCopies ? 30 : 0)
                        .rotationEffect(.degrees(Double($0) * 60))
                        
                }
            }
            .frame(maxHeight: UIScreen.main.bounds.height / 2)
            .rotationEffect(.degrees(offsetCopies ? 120 : 0))
            .scaleEffect(offsetCopies ? 2.0 : 0.2)
            .hueRotation(Angle(degrees: hueAdjust ? 0 : 360))
            .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
            .onAppear() {
                offsetCopies.toggle()
                hueAdjust.toggle()
            }
        }
    }
}

struct HueRotation_Previews: PreviewProvider {
    static var previews: some View {
        HueRotation()
    }
}
