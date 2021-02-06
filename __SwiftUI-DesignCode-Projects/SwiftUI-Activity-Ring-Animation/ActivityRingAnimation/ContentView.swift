import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            Home()
//                .preferredColorScheme(.dark)
//                .navigationBarTitle("Activity Ring")
//        }
        Home()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct Home: View {
    @State private var showFirstRing        = false
    @State private var showSecondRing       = false
    @State private var showThirdRing        = false
    
    var body: some View {
        ZStack {
            // RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500).scaleEffect(1.2)
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            VStack {
                Text("Activity Ring")
                    .font(.custom("TTFirsNeue-Bold", size: 32))
                    .foregroundColor(Color("light"))
                    .padding(.top, 16)
                
                Spacer(minLength: 0)
                
                ZStack {
                    // First Ring
                    Circle()
                        .trim(from: showFirstRing ? 1/8 : 1, to: 1)
                        .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                        .frame(width: 250, height: 250)
                        .foregroundColor(Color("red"))
                        .rotationEffect(.degrees(90)) // Flips the strokeStart
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                        .shadow(color: Color("dark"), radius: 20, y: 5)
                        //.offset(y: -130)
                        .animation(Animation.easeIn(duration: 1))
                        .onAppear() {
                            self.showFirstRing.toggle()
                        }
                    
                    // Second Ring
                    Circle()
                        .trim(from: showSecondRing ? 1/6 : 1, to: 1)
                        .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                        .frame(width: 189, height: 189)
                        .foregroundColor(Color("purple2"))
                        .rotationEffect(.degrees(90)) // Flips the strokeStart
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                        .shadow(color: Color("dark"), radius: 20, y: 5)
                        //.offset(y: -130
                        .animation(Animation.easeOut(duration: 1))
                        .onAppear() {
                            self.showSecondRing.toggle()
                        }
                    
                    // Third Ring
                    Circle()
                        .trim(from: showThirdRing ? 1/4 : 1, to: 1)
                        .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                        .frame(width: 128, height: 128)
                        .foregroundColor(Color("pink2"))
                        .rotationEffect(.degrees(90)) // Flips the strokeStart
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                        //.offset(y: -130)
                        .shadow(color: Color("dark"), radius: 20, y: 5)
                        .animation(Animation.easeInOut(duration: 1))
                        .onAppear() {
                            self.showThirdRing.toggle()
                        }
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.showFirstRing.toggle()
                    self.showSecondRing.toggle()
                    self.showThirdRing.toggle()
                    
                }) {
                    Text("Show Activity Ring")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                        .font(.custom("TTFirsNeue-Bold", size: 18))
                        .foregroundColor(Color("dark"))
                        .background(Capsule().fill(Color("orange")))
                }
                .padding(.bottom, 16)
            }
        }
        .statusBar(hidden: true)
    }
}
