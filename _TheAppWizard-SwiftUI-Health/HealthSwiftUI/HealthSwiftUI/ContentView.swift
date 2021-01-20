import SwiftUI

struct ContentView: View {
    @State private var rightPedaling = false
    @State private var jumping = false
    @State private var leftPedaling = false
    
    // Tyre
    @State var tyre1  = false
    @State var tyre2 = false
    
    var body: some View {
        // Main Stack
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(1)]), center: .center, startRadius: 5, endRadius: 500)
                .scaleEffect(1.2)
        
            VStack {
                ZStack {
                    VStack {
                        // Bycycle Animation
                        HStack {
                            ZStack {
                                ZStack {
                                    Image("leg_l") // Left Leg
                                        .animation(Animation.interpolatingSpring(stiffness: 200, damping: 50).speed(3).repeatForever(autoreverses: true))
                                        .rotationEffect(.degrees(leftPedaling ? -5 : 15), anchor: .topLeading)
                                        .offset(x: -30, y: leftPedaling ? -50 : -65)
                                        .onAppear() {
                                            self.leftPedaling.toggle()
                                        }
                                    Image("biker") // Biker
                                        .offset(y: -95)
                                    
                                    HStack {
                                        Image("tyres1") // Tyres
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .rotationEffect(.degrees(tyre1 ? 180 : 0))
                                            .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                                            .onAppear() {
                                                self.tyre2.toggle()
                                            }
                                        
                                        Image("tyres2") // Tyres
                                            .resizable()
                                            .frame(width : 100, height : 100)
                                            .rotationEffect(.degrees(tyre2 ? 360 : 0))
                                            .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true))
                                            .onAppear() {
                                                self.tyre1.toggle()
                                            }
                                    }
                                    
                                    Image("leg_r") // Right leg
                                        .animation(Animation.interpolatingSpring(stiffness: 200, damping: 50).speed(3).repeatForever(autoreverses: true))
                                        .rotationEffect(.degrees(rightPedaling ? 15 : -15), anchor: .topLeading)
                                        .offset(x: -40, y: rightPedaling ? -45 : -60)
                                        .onAppear() {
                                            self.rightPedaling.toggle()
                                        }
                                }
                                .animation(Animation.interpolatingSpring(stiffness: 200, damping: 50).speed(3).repeatForever(autoreverses: true))
                                .offset(y: jumping ? -1 : 1)
                                .onAppear() {
                                    self.jumping.toggle()
                                }
                            }
                            
                            Text("100")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding(.leading)
                    
                            Text("METERS")
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                            }
                        
                        ZStack {
                            VStack {
                                Text("HEALTH : BICYCLE ANIMATION")
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.white)
                        
                                // Reflection Vector If Needed
                                
                                /*Image("Reflection")
                                    .resizable()
                                    .padding()
                                    .frame(width : 450 , height : 180)
                                    .animation(Animation.easeIn(duration: 5))*/
                            }
                        }
                    }
                    .padding(.all)
                }
                
                Text("THE APP WIZARD")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
