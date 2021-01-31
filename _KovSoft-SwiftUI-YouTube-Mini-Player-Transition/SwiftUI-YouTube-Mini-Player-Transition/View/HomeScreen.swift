import SwiftUI

struct HomeScreen: View {
    @StateObject var player = VideoPlayerViewModel()
    
    // Gesture State To Avoid Drag Gesture Gliches
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(videos) { video in
                        VideoCardView(video: video)
                            .onTapGesture {
                                withAnimation {
                                    player.showPlayer.toggle()
                                }
                            }
                    }
                }
            }
            
            if player.showPlayer {
                MiniPlayerView()
                    .transition(.move(edge: .bottom))
                    .offset(y: player.offset)
                    .gesture(DragGesture()
                                .updating($gestureOffset, body: {
                                    (value, state, _) in
                                    state = value.translation.height
                                })
                                .onEnded(onEnded(value:))
                    )
            }
        }
        .onChange(of: gestureOffset, perform: { value in
            onChanged()
        })
        // Setting Environment Obj
        .environmentObject(player)
    }
    
    func onChanged() {
        if gestureOffset > 0 && !player.isMiniPlayer && player.offset + 72 <= player.height {
            player.offset = gestureOffset
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.default) {
            if !player.isMiniPlayer {
                player.offset = 0
                
                // Closing View
                if value.translation.height > UIScreen.main.bounds.height / 3 {
                    player.isMiniPlayer = true
                } else {
                    player.isMiniPlayer = false
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
