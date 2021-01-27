import SwiftUI

struct ContentView: View {
    @State private var rotateSeconds = false
    @State private var dotOffset = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // For Phone Screen
            Color(colorScheme == .dark ? "dark" : "light")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 100) {
                HStack(spacing: 8) {
                    Image(uiImage: #imageLiteral(resourceName: "profile"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Luan Nguyen")
                            .font(.custom("TTFirsNeue-Black", size: 16))
                            .fontWeight(.heavy)
                            .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                        
                        Text("UX Engineer")
                            .font(.custom("TTFirsNeue-Regular", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(colorScheme == .dark ? Color("light").opacity(0.6) : Color("dark").opacity(0.6))
                    }
                }
                .padding(.top, 16)
                
                Spacer()
                
                VStack(spacing: 40) {
                    Text("SwiftUI Clock")
                        .font(.custom("TTFirsNeue-Black", size: 32))
                        .fontWeight(.heavy)
                        .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                    
                    // Path For Positioning Dots
                    ZStack {
                        Circle()
                            .stroke()
                            .frame(width: 300, height: 300)
                            .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                            .opacity(0)
                        
                        // Small Dots: Equal Intervals
                        ForEach(0 ..< 60) {
                            Circle()
                                .frame(width: 3, height: 3)
                                .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                                .offset(y: -150)
                                .rotationEffect(.degrees(Double($0) * 6))
                                .opacity(0.2)
                        }
                        
                        // Big Dots: Equal Intervals
                        ForEach(0 ..< 12) {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                                .offset(y: -150)
                                .rotationEffect(.degrees(Double($0) * 30))
                        }
                        
                        // Clock Hands
                        Rectangle() // Minutes Handle
                            .frame(width: 6, height: 120)
                            .foregroundColor(Color("red"))
                            .rotationEffect(.degrees(0))
                            .cornerRadius(12)
                            .offset(y: 60)
                            
                        Rectangle() // Hours Handle
                            .frame(width: 6, height: 80)
                            .cornerRadius(12)
                            .foregroundColor(Color("red"))
                            .rotationEffect(.degrees(40), anchor: .top)
                            .offset(y: 40)
                        
                        ZStack { // Seconds handle
                            Rectangle()
                                .frame(width: 200, height: 1)
                                .foregroundColor(Color("red"))
                                .offset(x: 41)
                            
                            Circle()
                                .stroke()
                                .foregroundColor(Color("red"))
                                .frame(width: 18, height: 18)
                                .offset(x: 150)
                            
                            Circle()
                                .frame(width: 5, height: 5)
                                .foregroundColor(Color("red"))
                                .offset(x: -57)
                        }
                        .rotationEffect(.degrees(rotateSeconds ? 360 : 0))
                        .animation(Animation.linear(duration: 36).repeatForever(autoreverses: false))
                        .onAppear() { self.rotateSeconds.toggle() }
                        
                        Circle() // Central Point: Outer
                            .frame(width: 12, height: 12)
                            .foregroundColor(.white)
                            // Inner Overlays
                            .overlay(Circle().frame(width: 8, height: 8).foregroundColor(Color("red")))
                            .overlay(Circle().frame(width: 4, height: 4).foregroundColor(.white))
                    }
                }
                
                Spacer()
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
