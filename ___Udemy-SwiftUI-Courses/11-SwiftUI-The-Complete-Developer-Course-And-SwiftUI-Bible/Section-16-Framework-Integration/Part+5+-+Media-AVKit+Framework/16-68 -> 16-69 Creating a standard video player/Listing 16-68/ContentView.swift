
import SwiftUI

struct ContentView: View {
   @State private var showPlayer: Bool = false
   let videoPlayer = PlayerView()

   var body: some View {
      VStack {
         Button("Play Video") {
            self.showPlayer = true
         }
         Spacer()
      }.padding()
      .sheet(isPresented: $showPlayer) {
         self.videoPlayer
            .onAppear(perform: {
               self.videoPlayer.playVideo()
            })
            .onDisappear(perform: {
               self.videoPlayer.stopVideo()
            })
      }
   }
}
