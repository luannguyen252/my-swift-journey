import SwiftUI
import AVFoundation
import AVKit

struct VideoView: UIViewRepresentable {
    var videoURL        :   URL
    var previewLength   :   Double
    
    func makeUIView(context: Context) -> UIView {
        return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {

    }
}

#if DEBUG
struct VideoView_Previews: PreviewProvider {
    static var url  : URL   =   URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    
    static var previews: some View {
        VideoView(videoURL: url, previewLength: 15)
    }
}
#endif
