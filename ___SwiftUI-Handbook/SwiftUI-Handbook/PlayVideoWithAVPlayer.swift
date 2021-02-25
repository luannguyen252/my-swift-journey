import SwiftUI
import AVKit

struct PlayVideoWithAVPlayer: View {
    @State var player = AVPlayer()
    var videoUrl: String = "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player = AVPlayer(url: URL(string: videoUrl)!)
            }
    }
}

#if DEBUG
struct PlayVideoWithAVPlayer_Previews: PreviewProvider {
    static var previews: some View {
        PlayVideoWithAVPlayer()
    }
}
#endif
