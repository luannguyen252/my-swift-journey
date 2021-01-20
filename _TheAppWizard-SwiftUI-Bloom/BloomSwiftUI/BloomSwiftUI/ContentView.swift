import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                MainFlower()
                Image("leavespng")
                    .resizable()
                    .frame(width: 300, height: 100, alignment: .center)
                    .opacity(0.8)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                
                Text("SwiftUI Animation")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .opacity(0.8)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                
                Text("Bloom Flower")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .opacity(0.8)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            }
        }
    }
}

















struct MainFlower: View {
    @State private var rPetal = false
    @State private var lPetal = false
    @State private var mrPetal = false
    @State private var mlPetal = false
    @State private var customShadow = false
    var body: some View {
        ZStack {
            ZStack {
                Image("petal")
                   .resizable()
                    .frame(width: 90, height: 180, alignment: .center) // Middle
                   .rotationEffect(.degrees(0), anchor: .bottom)
               
                Image("petal")
                    .resizable()
                    .frame(width: 90, height: 180, alignment: .center)  // Middle left
                Image("petal")
                    .resizable()
                    .frame(width: 90, height: 180, alignment: .center)  // Left
                    .rotationEffect(.degrees( mlPetal ? -25 : -5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        mlPetal.toggle()
                    }
                
                Image("petal")
                    .resizable()
                    .frame(width: 90, height: 180, alignment: .center) // Middle right
                Image("petal")
                    .resizable()
                    .frame(width: 90, height: 180, alignment: .center)   // Right
                    .rotationEffect(.degrees( mrPetal ? 25 : 5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        mrPetal.toggle()
                    }
                
                Image("petal")
                    .resizable()
                    .frame(width: 90, height: 180, alignment: .center) // Left
                    .rotationEffect(.degrees( lPetal ? -50 : -10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        lPetal.toggle()
                    }
                
                Image("petal")
                    .resizable()
                    .frame(width: 90, height: 180, alignment: .center) // Right
                    .rotationEffect(.degrees( rPetal ? 50 : 10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rPetal.toggle()
                    }
                
            }.shadow(radius: customShadow ? 20 : 0)
             .hueRotation(Angle(degrees: customShadow ? 0 : 165))
             .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
             .onAppear {
                customShadow.toggle()
            }
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
