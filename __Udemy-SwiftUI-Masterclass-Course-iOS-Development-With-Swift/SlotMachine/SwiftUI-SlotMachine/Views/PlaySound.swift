import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, ofType: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: ofType) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: Cannot play the file at given path resource")
        }
    }
}
