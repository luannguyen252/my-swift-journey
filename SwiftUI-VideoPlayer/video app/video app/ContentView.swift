import SwiftUI
import AVKit

struct ContentView: View {
    @State private var isVideoPlaying = false
    
    let urlString =  "https://devstreaming-cdn.apple.com/videos/wwdc/2019/204isgnpbqud244/204/hls_vod_mvp.m3u8"
    
    var body: some View {
        VStack {
            Text("Hello,Video")
            
            Button(action :play){
                Image(systemName: "play")
            }
            
        }
    }
    
    func play() {
        isVideoPlaying.toggle()
        
        guard let url = URL(string: urlString) else { return }
        
        let player = AVPlayer(url: url)
        
        let controller = AVPlayerViewController ()
        controller.player = player
        
        UIApplication.shared.windows.first?.rootViewController?
            .present(controller,animated:true)
        player.play()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
