import SwiftUI

struct ContentView: View {
    // Variables
    @State private var rate = false
    @State private var heartBeat = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("HEALTH  HEARBEAT SWIFTUI")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white).opacity(0.6)
                
                ZStack {
                    // Outline Heart
                    Image("heart")
                        .scaleEffect(heartBeat ? 1 : 1.3)
                        .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(1.3/2).repeatForever(autoreverses: false))
                        .onAppear() { self.heartBeat.toggle() }
                    
                    // Pulse Animation
                    Image("mypulse")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Rectangle().offset(x: rate ? 0 : -125))
                        .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(1.3).repeatForever(autoreverses: true).delay(0.2))
                        .offset(x: -12)
                        .onAppear() {
                            self.rate.toggle()
                        }
                }
                
                HStack {
                    Text("THE APP WIZARD")
                        .font(.body)
                        .fontWeight(.thin)
                       .foregroundColor(Color.red).opacity(0.6)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.light)
    }
}

