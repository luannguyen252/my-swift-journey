import SwiftUI

struct MiniPlayerView: View {
    @EnvironmentObject var player: VideoPlayerViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VideoPlayerView()
                    .frame(width: player.isMiniPlayer ? 150 : player.width, height: player.isMiniPlayer ? 72 : getFrame())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                // Controls
                VideoControls()
            )
            
            GeometryReader { reader in
                ScrollView {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Video 1")
                                .font(.system(size: 24, weight: .heavy, design: .default))
                                .foregroundColor(Color("dark"))
                            
                            Text("1.000 views - 31 Jan 2021")
                                .font(.system(size: 14, weight: .regular, design: .default))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            PlayBackVideoButtons(image: "hand.thumbsup", text: "123K")
                            PlayBackVideoButtons(image: "hand.thumbsdown", text: "1K")
                            PlayBackVideoButtons(image: "square.and.arrow.up", text: "Share")
                            PlayBackVideoButtons(image: "square.and.arrow.down", text: "Download")
                            PlayBackVideoButtons(image: "message", text: "Live Chat")
                        }
                        
                        Divider()
                        
                        ForEach(videos) { video in
                            VideoCardView(video: video)
                        }
                    }
                    .padding()
                }
                .onAppear(perform: {
                    player.height = reader.frame(in: .global).height + 264
                })
            }
            .background(Color.white)
            .opacity(player.isMiniPlayer ? 0 : getOpacity())
            .frame(height: player.isMiniPlayer ? 0 : nil)
        }
        .background(
            Color.white
                .ignoresSafeArea(.all, edges: .all)
                .onTapGesture {
                    withAnimation {
                        player.width = UIScreen.main.bounds.width
                        player.isMiniPlayer.toggle()
                    }
                }
        )
    }
    
    // Getting Frame And Opacity While Dragging
    func getFrame() -> CGFloat {
        let progress = player.offset / (player.height - 100)
        
        if (1 - progress) <= 1.0 {
            let videoHeight : CGFloat = (1 - progress) * 264
            
            // Stop Play Video at 72
            if videoHeight <= 72 {
                // Decreasing Width
                let percent = videoHeight / 72
                let videoWidth : CGFloat = percent * UIScreen.main.bounds.width
                DispatchQueue.main.async {
                    // Stop At 150
                    if videoWidth >= 150 {
                        player.width = videoWidth
                    }
                }
                return 72
            }
            
            // Preview will have animation problems
            DispatchQueue.main.async {
                player.width = UIScreen.main.bounds.width
            }
            
            return videoHeight
        }
        
        return 264
    }
    
    func getOpacity() -> Double {
        let progress = player.offset / player.height
        if progress <= 1 {
            return Double(1 - progress)
        }
        return 1
    }
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct PlayBackVideoButtons: View {
    var image: String
    var text: String
    
    var body: some View {
        Button(action: {
            print("Button Pressed!")
        }, label: {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.title3)
                Text(text)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
        })
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
    }
}

struct VideoControls: View {
    @EnvironmentObject var player: VideoPlayerViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 72, height: 72)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Video 1")
                    .font(.system(size: 16, weight: .heavy, design: .default))
                    .foregroundColor(Color("dark"))
                    .lineLimit(1)
                
                Text("Luan Nguyen")
                    .font(.system(size: 14, weight: .regular, design: .default))
            }
            
            Button(action: {
                print("Button Pressed!")
            }) {
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            
            Button(action: {
                // withAnimation {
                    player.showPlayer.toggle()
                    player.offset = 0
                    player.isMiniPlayer.toggle()
                // }
            }) {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
        .padding(.trailing)
    }
}
