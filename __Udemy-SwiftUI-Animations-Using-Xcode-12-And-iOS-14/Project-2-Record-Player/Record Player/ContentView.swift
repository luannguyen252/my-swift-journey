
import SwiftUI

struct ContentView: View {
    
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)
            
            //MARK: - RECORD PLAYER BOX
            RecordPlayerBox().offset(y: -100)
            
            //MARK: - RECORD
            VStack {
                //MARK: - ADD THE RECORD
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                
                //MARK: - ADD THE ARM
                ArmView(rotateArm: $rotateArm)
                
                //MARK: - ADD THE PLAY / STOP BUTTON
                
                Button(action: {
                    shouldAnimate.toggle()
                    if shouldAnimate {
                        degrees = 36000
                        rotateArm.toggle()
                        playSound(sound: "music", type: "m4a")
                    } else {
                        rotateArm.toggle()
                        degrees = 0
                        audioPlayer?.stop()
                    }
                }) {
                    HStack(spacing: 8) {
                        if !shouldAnimate {
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(Color.black, lineWidth: 1.25))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
