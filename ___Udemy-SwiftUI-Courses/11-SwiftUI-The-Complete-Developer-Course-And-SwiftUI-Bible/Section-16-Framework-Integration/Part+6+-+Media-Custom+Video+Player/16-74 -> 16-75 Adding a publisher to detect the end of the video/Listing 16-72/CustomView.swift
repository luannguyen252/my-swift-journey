
import SwiftUI
import AVFoundation

class ViewData: NSObject {
   var playerItem: AVPlayerItem!
   var player: AVPlayer!
   var playerLayer: AVPlayerLayer!
}
struct CustomView: UIViewRepresentable {
   @Binding var playing: Bool
   @Binding var progress: CGFloat
   var view = UIView()
   var viewData = ViewData()
   var publisherPlayer = NotificationCenter.Publisher(center: .default, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime)

    func rewindVideo() {
        self.viewData.playerItem.seek(to: CMTime.zero, completionHandler: {(finished) in
            if finished {
                let main = OperationQueue.main
                main.addOperation {
                    self.playing = false
                    self.progress = 0
                }
            }
        })
    }
    
   func makeUIView(context: Context) -> UIView {
      let bundle = Bundle.main
      let videoURL = bundle.url(forResource: "videotrees", withExtension: "mp4")

      let asset = AVURLAsset(url: videoURL!)
      viewData.playerItem = AVPlayerItem(asset: asset)
      viewData.player = AVPlayer(playerItem: viewData.playerItem)
      viewData.playerLayer = AVPlayerLayer(player: viewData.player)
      let layer = view.layer
      layer.addSublayer(viewData.playerLayer)

      let main = DispatchQueue.main
      let interval = CMTime(value: 1, timescale: 2)
      viewData.player.addPeriodicTimeObserver(forInterval: interval, queue: main, using: { time in
         let duration = self.viewData.playerItem.duration
         let position = time.seconds / duration.seconds
         self.progress = CGFloat(position)
      })
      return view
   }
   func updateUIView(_ uiView: UIView, context: Context) {
      let main = OperationQueue.main
      main.addOperation {
         if self.viewData.playerItem != nil {
            self.viewData.playerLayer.frame = uiView.bounds
         }
      }
   }
   func playVideo() {
      if viewData.playerItem.status == .readyToPlay {
         if self.playing {
            viewData.player.pause()
            self.playing = false
         } else {
            viewData.player.play()
            self.playing = true
         }
      }
   }
}
