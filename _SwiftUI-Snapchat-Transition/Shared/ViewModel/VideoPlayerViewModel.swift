import SwiftUI
import AVKit

class VideoPlayerViewModel: ObservableObject {
    // Hero Animation Properties
    @Published var showPlayer = false
    @Published var offset: CGSize = .zero
    @Published var scale: CGFloat = 1
    @Published var selectedVideo : Video = Video(player: AVPlayer())
}
