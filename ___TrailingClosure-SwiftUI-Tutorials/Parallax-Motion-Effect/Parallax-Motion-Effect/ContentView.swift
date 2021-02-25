import SwiftUI
import CoreMotion

struct ContentView: View {
    @ObservedObject var manager = MotionManager()
    
    var body: some View {
        Color.red
            .frame(width: 100, height: 100, alignment: .center)
            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 10))
    }
}

// Parallax Motion Modifier
struct ParallaxMotionModifier: ViewModifier {
    @ObservedObject var manager : MotionManager = MotionManager()
    
    var magnitude               : Double
    
    func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(manager.roll * magnitude), y: CGFloat(manager.pitch * magnitude))
    }
}

// Motion Manager
class MotionManager: ObservableObject {
    @Published var pitch    : Double = 0.0
    @Published var roll     : Double = 0.0
    
    private var manager     : CMMotionManager
    
    init() {
        self.manager                            = CMMotionManager()
        self.manager.deviceMotionUpdateInterval = 1/60
        self.manager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let motionData   = motionData {
                self.pitch      = motionData.attitude.pitch
                self.roll       = motionData.attitude.roll
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
