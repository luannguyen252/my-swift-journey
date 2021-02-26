
import SwiftUI
import AVFoundation

class ViewData: NSObject {
   var playerItem1: AVPlayerItem!
   var playerItem2: AVPlayerItem!
   var player: AVQueuePlayer!
   var playerLayer: AVPlayerLayer!

   func setObserver() {
      playerItem1.addObserver(self, forKeyPath: "status", options: [], context: nil)
   }
   override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      if playerItem1.status == .readyToPlay {
         playerItem1.removeObserver(self, forKeyPath: "status")
         player.play()
      }
   }
}
struct CustomView: UIViewRepresentable {
   var view = UIView()
   var viewData = ViewData()
    
   func makeUIView(context: Context) -> UIView {
      let bundle = Bundle.main
      let videoURL1 = bundle.url(forResource: "videotrees", withExtension: "mp4")
      let videoURL2 = bundle.url(forResource: "videobeaches", withExtension: "mp4")
        
      let asset1 = AVURLAsset(url: videoURL1!)
      let asset2 = AVURLAsset(url: videoURL2!)
      viewData.playerItem1 = AVPlayerItem(asset: asset1)
      viewData.playerItem2 = AVPlayerItem(asset: asset2)
      viewData.player = AVQueuePlayer(items: [viewData.playerItem1, viewData.playerItem2])
        
      viewData.playerLayer = AVPlayerLayer(player: viewData.player)
      let layer = view.layer
      layer.addSublayer(viewData.playerLayer)
      viewData.setObserver()

      return view
   }
   func updateUIView(_ uiView: UIView, context: Context) {
      let main = OperationQueue.main
      main.addOperation {
         if self.viewData.playerItem1 != nil {
            self.viewData.playerLayer.frame = uiView.bounds
         }
      }
   }
}
