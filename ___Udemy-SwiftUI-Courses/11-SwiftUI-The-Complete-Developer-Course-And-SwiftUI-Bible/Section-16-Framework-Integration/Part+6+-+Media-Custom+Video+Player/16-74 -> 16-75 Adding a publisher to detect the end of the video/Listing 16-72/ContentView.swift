
import SwiftUI

class ContentData: ObservableObject {
   @Published var playing: Bool = false
   @Published var progress: CGFloat = 0
}
struct ContentView: View {
   @ObservedObject var contentData = ContentData()
   var videoPlayer: CustomView!

   init() {
      videoPlayer = CustomView(playing: $contentData.playing, progress: $contentData.progress)
   }
   var body: some View {
      ZStack {
         videoPlayer
         VStack {
            Spacer()
            HStack {
               Button(contentData.playing ? "Stop" : "Play") {
                  self.videoPlayer?.playVideo()
               }.foregroundColor(Color.black)
               GeometryReader { geometry in
                  HStack {
                     Rectangle()
                        .fill(Color(red: 0, green: 0.4, blue: 0.8, opacity: 0.8))
                        .frame(width: geometry.size.width * self.contentData.progress, height: 20)
                     Spacer()
                  }
               }
            }
            .padding([.leading, .trailing])
            .frame(height: 50)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
         }.onReceive(videoPlayer.publisherPlayer, perform: { _ in
            self.videoPlayer.rewindVideo()
         })
      }
   }
}
