
import SwiftUI
import AVFoundation

class ViewData: NSObject {
   var playerItem: AVPlayerItem!
   var player: AVPlayer!
   var playerLayer: AVPlayerLayer!
    
   func setObserver() {
      playerItem.addObserver(self, forKeyPath: "status", options: [], context: nil)
   }
   override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      if playerItem.status == .readyToPlay {
         playerItem.removeObserver(self, forKeyPath: "status")
         player.play()
      }
   }
}
struct CustomView: UIViewRepresentable {
   var view = UIView()
   var viewData = ViewData()

   func makeUIView(context: Context) -> UIView {
      let bundle = Bundle.main
      let videoURL = bundle.url(forResource: "videotrees", withExtension: "mp4")

      let asset = AVURLAsset(url: videoURL!)
      viewData.playerItem = AVPlayerItem(asset: asset)
      viewData.player = AVPlayer(playerItem: viewData.playerItem)

      viewData.playerLayer = AVPlayerLayer(player: viewData.player)
      let layer = view.layer
      layer.addSublayer(viewData.playerLayer)
      viewData.setObserver()

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
}
