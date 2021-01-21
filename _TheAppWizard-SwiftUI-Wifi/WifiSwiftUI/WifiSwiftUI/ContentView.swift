import SwiftUI

struct ContentView: View {
    // Animation State
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .center) {
            Text("SCAN FOR WIFI")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.all, 10)
                .frame(width: nil)
            
            Button("WIFI") {
                // self.animationAmount += 1
            }
            .padding(50)
            .background(Color.green) // Your Fav Color
            .foregroundColor(Color.white)
            .clipShape(Circle())
            // Add overlay for effect
            .overlay(Circle()
                        .stroke(Color.green)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
            )
            .onAppear{ self.animationAmount = 2}
            
            Text("HELLO WORLD")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.all, 10)
                .frame(width: nil)
        }
        .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
