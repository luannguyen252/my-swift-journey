import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            GlassView()
            
            VStack {
                Spacer()
                    .frame(height: 10)
                
                Text("HAPPY NEW YEAR")
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                
                Text("2021")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("The App Wizard")
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
            }
        }
    }
}

// Glass View
struct GlassView: View {
    let screen = UIScreen.main.bounds
    @State var isAnimated = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    // First Wave
                    getWavePath(interval: screen.width, amplitude: 120, base:  150 + screen.height/2)
                        .foregroundColor(Color.yellow.opacity(0.6))
                        .offset(x: isAnimated ? -1 * screen.width : 0)
                        .animation(
                            Animation.linear(duration: 4)
                                .repeatForever(autoreverses: false)
                        )
                    
                    // Second Wave
                    getWavePath(interval: screen.width * 1.2, amplitude: 130, base: 160 + screen.height/2)
                        .foregroundColor(Color.yellow.opacity(0.7))
                        .offset(x: isAnimated ? -1 * screen.width * 1.2 : 0)
                        .animation(
                            Animation.linear(duration: 5)
                                .repeatForever(autoreverses: false)
                        )
                    
                    // Third Wave
                    getWavePath(interval: screen.width * 1.5, amplitude: 140, base: 170 + screen.height/2)
                        .foregroundColor(Color.yellow.opacity(1))
                        .offset(x: isAnimated ? -1 * screen.width * 1.5 : 0)
                        .animation(
                            Animation.linear(duration: 3)
                                .repeatForever(autoreverses: false)
                        )
                }
                .offset(x: 0, y: -250)
                .onAppear(){ self.isAnimated = true }
                
                Image("glass")
                    .resizable()
                    .frame(width: 380, height: 560, alignment: .center)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            }
        }
    }
    
    // Wave Function Produces Sine Wave
    func getWavePath(interval: CGFloat, amplitude: CGFloat = 100, base: CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: base))
            path.addCurve(
                to: CGPoint(x: 1*interval , y: base),
                control1: CGPoint(x: interval * (0.35), y: amplitude + base ),
                control2: CGPoint(x: interval * (0.65), y: -amplitude + base)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval , y: base),
                control1: CGPoint(x: interval * (1.35), y: amplitude + base ),
                control2: CGPoint(x: interval * (1.65), y: -amplitude + base)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: screen.height))
            path.addLine(to: CGPoint(x: 0, y: screen.height))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
