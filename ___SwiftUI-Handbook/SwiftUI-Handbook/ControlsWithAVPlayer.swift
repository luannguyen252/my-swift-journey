import SwiftUI
import AVKit

struct ControlsWithAVPlayer: View {
    @State var player = AVPlayer()
    var videoUrl: String = "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"
    
    // Set a start time
    @State var videoStartTime: CMTime = CMTimeMake(value: 10, timescale: 1)
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                // Automatically play the video
                player.play()
                
                // Pause the video
                // player.pause()
                
                // Set a start time
                // player.seek(to: videoStartTime)
                
                // Set a play rate
                // player.rate = 1.5
                
                // Get current video time
                // player.currentTime()
                
                // Get video duration
                // player.currentItem!.asset.duration
                
                // Convert CMTime to seconds
                // CMTimeGetSeconds(player.currentTime())
            }
    }
}

#if DEBUG
struct ControlsWithAVPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ControlsWithAVPlayer()
    }
}
#endif
