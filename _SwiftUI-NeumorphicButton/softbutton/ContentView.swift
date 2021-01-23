import SwiftUI
import CoreHaptics

struct ContentView: View {
    let engine = try? CHHapticEngine()
    let event = CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0)
    @State var isPressed = false
    @State var isOn = false {
        didSet {
            print("here")
            if self.engine != nil {
                // If it is - give some haptic feedback
                let pattern = try? CHHapticPattern(events: [self.event], parameters: [])
                let player = try? self.engine?.makePlayer(with: pattern!)
                try? self.engine!.start()
                try? player?.start(atTime: 0)
            }
        }
    }
    
    var body: some View {
        Color("Background")
            .edgesIgnoringSafeArea(.all)

        .overlay(
            VStack {
                Text("Soft Buttons")
                    .font(.largeTitle)
                    .bold()
                    .shadow(radius: 10)

                Group {
                    Toggle("", isOn: $isOn)
                        .toggleStyle(SoftSwitch(width: 70))
                        .padding(20)
                    
                    HStack(spacing: 20) {
                        SoftToggleButton(text: "1", cornerRadius: 33)
                            .frame(width: 80, height: 80)
                        SoftToggleButton(text: "2", cornerRadius: 33)
                            .frame(width: 80, height: 80)
                        SoftToggleButton(text: "3", cornerRadius: 33)
                            .frame(width: 80, height: 80)
                    }
                    
                    Button(action: {
                        print("gfdg")
                    }) {
                        Text("new")
                            .frame(width: 200, height: 70)
                    }
                    .padding(20)
                    .buttonStyle(SoftButton(width: 70, height: 70, cornerRadius: 50))
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
