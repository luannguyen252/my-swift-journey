import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        
        // Video URL
        let bundle_url = Bundle.main.path(forResource: "video1", ofType: "mp4")
        let video_url = URL(fileURLWithPath: bundle_url!)
        
        // Player
        let player = AVPlayer(url: video_url)
        controller.player = player
        
        // Hiding Controls
        controller.showsPlaybackControls = false
        controller.player?.play()
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
