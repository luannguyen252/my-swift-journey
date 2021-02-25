import SwiftUI

struct ContentView: View {
    @State private var oneMoves     = false
    @State private var twoMoves     = false
    @State private var threeMoves   = false
    @State private var fourMoves    = false
    @State private var fiveMoves    = false
    @State private var sixMoves     = false
    @State private var sevenMoves   = false
    @State private var eightMoves   = false
    @State private var nineMoves    = false
    @State private var tenMoves     = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            ZStack {
                // 1.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: oneMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.oneMoves.toggle()
                    }
                
                // 2.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: twoMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.1))
                    .onAppear() {
                        self.twoMoves.toggle()
                    }
                
                // 3.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: threeMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.2))
                    .onAppear() {
                        self.threeMoves.toggle()
                    }
                
                // 4.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 110, height: 110)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: fourMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.3))
                    .onAppear() {
                        self.fourMoves.toggle()
                    }
                
                // 5.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 140, height: 140)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: fiveMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.4))
                    .onAppear() {
                        self.fiveMoves.toggle()
                    }
                
                // 6.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 170, height: 170)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: sixMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.5))
                    .onAppear() {
                        self.sixMoves.toggle()
                    }
                
                // 7.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: sevenMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.6))
                    .onAppear() {
                        self.sevenMoves.toggle()
                    }
                
                // 8.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 230, height: 230)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: eightMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.7))
                    .onAppear() {
                        self.eightMoves.toggle()
                    }
                
                // 9.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 260, height: 260)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: nineMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.8))
                    .onAppear() {
                        self.nineMoves.toggle()
                    }
                
                // 10.
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 290, height: 290)
                    .foregroundColor(Color("pink2"))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: tenMoves ? -150 : 150)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.9))
                    .onAppear() {
                        self.tenMoves.toggle()
                    }
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
