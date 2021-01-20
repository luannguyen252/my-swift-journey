import SwiftUI

struct ContentView: View {
    @State private var hello = false
    @State private var showCentralCircle = false
    
    var body: some View {
        VStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                    .frame(height: nil)
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(1.2)
                
                // Background Gradient
                ZStack {
                    ZStack { // Vertical
                        ZStack { // Square gradient
                            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), center: .center, startRadius: 5, endRadius: 100)
                                // Clip gradient to circle
                                .clipShape(Circle()).frame(width: 100, height: 100)
                                .offset(y: -41)
                        }
                        
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), center: .center, startRadius: 5, endRadius: 90)
                                .clipShape(Circle()).frame(width: 100, height: 100)
                                .offset(y: 41)
                        }
                    }
                    .opacity(0.5)
                    
                    ZStack { // At 60°
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), center: .center, startRadius: 5, endRadius: 100)
                                .clipShape(Circle()).frame(width: 100, height: 100)
                                .offset(y: -41)
                        }
                        
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), center: .center, startRadius: 5, endRadius: 90)
                                .clipShape(Circle()).frame(width: 100, height: 100)
                                .offset(y: 41)
                        }
                    }
                    .opacity(0.5).rotationEffect(.degrees(60), anchor: .center)
                    
                    ZStack { // At 60*2°
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), center: .center, startRadius: 5, endRadius: 100)
                                .clipShape(Circle()).frame(width: 100, height: 100)
                                .offset(y: -41)
                        }
                        
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), center: .center, startRadius: 5, endRadius: 90)
                                .clipShape(Circle()).frame(width: 100, height: 100)
                                .offset(y: 41)
                        }
                    }
                    .opacity(0.5)
                    .rotationEffect(.degrees(60*2), anchor: .center)
                }
                // Whole flower
                .rotationEffect(.degrees(hello ? 360 : 0), anchor: .center)
                .scaleEffect(hello ? 1 : 0.2)
                .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
                .opacity(hello ? 1 : 0.5)
                .onAppear() {
                    self.hello.toggle()
                }
                
                // Central Circle Purple With Animation
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.purple)
                    .scaleEffect(showCentralCircle ? 0 : 0.8)
                    .opacity(showCentralCircle ? 0 : 1)
                    .blendMode(.plusLighter)
                    .blur(radius: 1)
                    .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.showCentralCircle.toggle()
                    }
            }
            
            // TITLE
            Text("FLOWER 6 PETALS")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
