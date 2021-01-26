import SwiftUI

struct ContentView: View {
    @State private var animationAmount1 = 0.0
    @State private var animationAmount2 = 0.0
    @State private var animationAmount3 = 0.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 48) {
            // 1.
            Button(action: {
                withAnimation(.interpolatingSpring(stiffness: 4, damping: 1)) {
                    animationAmount1 += 360
                }
            }, label: {
                Text("HAPPY NEW YEAR")
                    .font(.custom("TTFirsNeue-Black", size: 40)).bold()
                    .padding(48)
                    .multilineTextAlignment(.center)
                    .background(LinearGradient.init(gradient: Gradient(colors: [Color("pink"), Color("pink2")]), startPoint: .topLeading, endPoint: .trailing))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .shadow(color: Color("pink").opacity(0.75), radius: 24, x: 4, y: 4)
                    .rotation3DEffect(
                        .degrees(Double(animationAmount1)), axis: (x: 0.2, y: 0.8, z: 0.3)
                    )
            })
            
            // 2.
            Button(action: {
                withAnimation(.interpolatingSpring(stiffness: 4, damping: 1)) {
                    animationAmount2 += 360
                }
            }, label: {
                Text("2021")
                    .font(.custom("TTFirsNeue-Black", size: 40)).bold()
                    .padding(48)
                    .multilineTextAlignment(.center)
                    .background(LinearGradient.init(gradient: Gradient(colors: [Color("purple"), Color("purple2")]), startPoint: .topLeading, endPoint: .trailing))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .shadow(color: Color("purple").opacity(0.75), radius: 24, x: 4, y: 4)
                    .rotation3DEffect(
                        .degrees(Double(animationAmount2)), axis: (x: 0.7, y: 1.0, z: 0.8)
                    )
            })
            
            // 3.
            Button(action: {
                withAnimation(.interpolatingSpring(stiffness: 4, damping: 1)) {
                    animationAmount3 += 360
                }
            }, label: {
                Text("MAY THIS NEW YEAR BRINGS MORE HAPPINESS🔥")
                    .font(.custom("TTFirsNeue-Black", size: 40)).bold()
                    .padding(48)
                    .multilineTextAlignment(.center)
                    .background(LinearGradient.init(gradient: Gradient(colors: [Color("red"), Color("orange")]), startPoint: .topLeading, endPoint: .trailing))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .shadow(color: Color("red").opacity(0.75), radius: 24, x: 4, y: 4)
                    .rotation3DEffect(
                        .degrees(Double(animationAmount3)), axis: (x: 0.3, y: 1.0, z: 0.6)
                    )
            })
        }
        .padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
