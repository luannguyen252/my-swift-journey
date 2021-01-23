import AVFoundation
import CoreHaptics

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("couldnt find sound")
        }
    }
}

let engine = try? CHHapticEngine()
let event = CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0)

func playHaptic() {
    if engine != nil {
        // If it is - give some haptic feedback
        let pattern = try? CHHapticPattern(events: [event], parameters: [])
        let player = try? engine?.makePlayer(with: pattern!)
        try? engine!.start()
        try? player?.start(atTime: 0)
    }
}
