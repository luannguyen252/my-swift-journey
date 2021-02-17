import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)

            VStack {
                // 1.
                VStack {
                    Image("thumb4")
                        .resizable()
                        .frame(width: 256, height: 171)
                        .cornerRadius(24)
                        .shadow(color: Color("red").opacity(animate ? 0.5 : 0.25), radius: animate ? 32 : 16, x: animate ? 4 : 2, y: animate ? 4 : 2)
                }
                .rotation3DEffect(.degrees(animate ? 24 : -24), axis: (x: animate ? 90 : -45, y: animate ? -45 : -90, z: 0))
                .animation(Animation.easeInOut(duration: 3.5).repeatForever(autoreverses: true))
                .onAppear() {
                    animate.toggle()
                }
                .padding(32)

                // 2.
                VStack {
                    Image("thumb5")
                        .resizable()
                        .frame(width: 256, height: 171)
                        .cornerRadius(24)
                        .shadow(color: Color("pink").opacity(animate ? 0.5 : 0.25), radius: animate ? 32 : 16, x: animate ? 4 : 2, y: animate ? 4 : 2)
                }
                .rotation3DEffect(.degrees(animate ? 32 : -32), axis: (x: animate ? 90 : -45, y: animate ? -45 : -90, z: 0))
                .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
                .onAppear() {
                    animate.toggle()
                }
                .padding(32)
                
                // 3.
                VStack {
                    Image("thumb6")
                        .resizable()
                        .frame(width: 256, height: 171)
                        .cornerRadius(24)
                        .shadow(color: Color("purple").opacity(animate ? 0.5 : 0.25), radius: animate ? 32 : 16, x: animate ? 4 : 2, y: animate ? 4 : 2)
                }
                .rotation3DEffect(.degrees(animate ? 40 : -40), axis: (x: animate ? 90 : -45, y: animate ? -45 : -90, z: 0))
                .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
                .onAppear() {
                    animate.toggle()
                }
                .padding(32)
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
