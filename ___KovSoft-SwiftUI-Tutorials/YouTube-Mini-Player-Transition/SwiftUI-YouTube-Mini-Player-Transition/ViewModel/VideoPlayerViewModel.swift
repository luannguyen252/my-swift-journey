import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    // Show MiniPlayer
    @Published var showPlayer = false
    
    // Gesture Offset
    @Published var offset: CGFloat = 0
    @Published var width: CGFloat = UIScreen.main.bounds.width
    @Published var height : CGFloat = 0
    @Published var isMiniPlayer = false
}
