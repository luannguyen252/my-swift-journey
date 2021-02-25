import SwiftUI
import AVKit

struct PlayerView: View {
  @State private var player: AVQueuePlayer?
  @State private var videoLooper: AVPlayerLooper?

  var body: some View {
    VideoPlayer(player: player)
      .onAppear {
        if player == nil {
          // swiftlint:disable:next force_unwrapping
          let templateItem = AVPlayerItem(url: Bundle.main.url(forResource: "rick", withExtension: "mp4")!)
          player = AVQueuePlayer(playerItem: templateItem)
          // swiftlint:disable:next force_unwrapping
          videoLooper = AVPlayerLooper(player: player!, templateItem: templateItem)
        }

        if player?.isPlaying == false { player?.play() }
      }
      .edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView()
  }
}
#endif
