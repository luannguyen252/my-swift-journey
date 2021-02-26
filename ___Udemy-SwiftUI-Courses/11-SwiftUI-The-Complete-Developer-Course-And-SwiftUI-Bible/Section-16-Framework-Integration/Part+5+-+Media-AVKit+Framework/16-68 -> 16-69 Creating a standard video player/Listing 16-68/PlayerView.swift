
import SwiftUI
import AVFoundation
import AVKit

struct PlayerView: UIViewControllerRepresentable {
   let player: AVPlayer?
    
   init() {
      let bundle = Bundle.main
      let videoURL = bundle.url(forResource: "videotrees", withExtension: "mp4")
      player = AVPlayer(url: videoURL!)
   }
   func makeUIViewController(context: Context) -> AVPlayerViewController {
      let controller = AVPlayerViewController()
      controller.player = player
      return controller
   }
   func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
    
   func playVideo() {
      player?.play()
   }
   func stopVideo() {
      player?.pause()
   }
}
