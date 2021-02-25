import SwiftUI

struct PulsatingAnimation: View {
    @State private var animateHue = false
    @State private var animateProgress = 0.0
    @State private var animateSmallCircle = false
    @State private var animateLargeCircle = false
    @State private var animateTag = -15.0
    @State private var animateSound = 10
    
    let phoneBackground = LinearGradient(gradient: Gradient(colors: [Color("orange"), Color("red")]), startPoint: .topLeading, endPoint: .bottomLeading)
    
    var body: some View {
        ZStack {
            Image("mac1")
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
                .blur(radius: 10)
                .hueRotation(.degrees(animateHue ? -120 : 180))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    animateHue.toggle()
                }
            
            phoneBackground
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
                .blur(radius: 8)
            
            VStack {
                HStack {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.title)
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .font(.title)
                }
                .padding()
                
                ZStack {
                    Circle()
                        .stroke()
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50, alignment: .center)
                        .scaleEffect(animateLargeCircle ? 1.2 : 0.73)
                        .opacity(animateLargeCircle ? 0 : 1)
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear() {
                            animateLargeCircle.toggle()
                        }
                    
                    Circle()
                        .stroke()
                        .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.width - 100, alignment: .center)
                        .scaleEffect(animateSmallCircle ? 1.2 : 0.84)
                        .opacity(animateSmallCircle ? 0 : 1)
                        .animation(Animation.easeOut(duration: 4).delay(1).repeatForever(autoreverses: false))
                        .onAppear() {
                            animateSmallCircle.toggle()
                        }
                    
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.width - 150, alignment: .center)
                        .opacity(0.2)
                    
                    Circle()
                        .trim(from: CGFloat(animateProgress), to: 1)
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .frame(width: UIScreen.main.bounds.width - 150, height: UIScreen.main.bounds.width - 150, alignment: .center)
                        .rotationEffect(.degrees(-90))
                        .animation(Animation.linear(duration: 300))
                        .onAppear() {
                            animateProgress = 8/9
                        }
                }
            }
        }
    }
}

struct PulsatingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingAnimation()
    }
}
