import SwiftUI

struct ContentView: View {
    @State private var pressShutter = false
    @State private var rotateCamera = false
    @State private var lensAnimates = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            ZStack {
                // 1. Camera
                Image(systemName: "camera.fill")
                    .font(.largeTitle)
                    .scaleEffect(2)
                    .foregroundColor(Color("purple"))
                    .offset(x: 0.4, y: 0)
                
                // 2. Shutter
                Circle()
                    .trim(from: 1/2, to: 1)
                    .frame(maxWidth: 18, maxHeight: 18)
                    .foregroundColor(Color("pink2"))
                    .offset(x: -28, y: pressShutter ? -32 : -26)
                    .animation(Animation.easeIn(duration: 0.2).delay(3).repeatForever(autoreverses: false))

                // 3. Lens
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("purple2"))
                    .scaleEffect(lensAnimates ? 1.25 : 1)
                    .offset(x: 0, y: 3)
                    .animation(Animation.timingCurve(1, 0, 0, 1, duration: 0.2).delay(3.1).repeatForever(autoreverses: false))
            }
            .rotationEffect(.degrees(rotateCamera ? 12 : -12), anchor: .center)
            .animation(Animation.spring().delay(2).repeatForever(autoreverses: true))
            .onAppear() {
                self.rotateCamera.toggle()
                self.pressShutter.toggle()
                self.lensAnimates.toggle()
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
