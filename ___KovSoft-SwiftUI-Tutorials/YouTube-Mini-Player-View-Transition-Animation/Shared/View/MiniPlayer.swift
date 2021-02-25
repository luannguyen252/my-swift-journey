//
//  MiniPlayer.swift
//  Youtube Transition (iOS)
//
//  Created by Balaji on 13/01/21.
//

import SwiftUI

struct MiniPlayer: View {
    
    // ScreenHeight..
    
    @EnvironmentObject var player: VideoPlayerViewModel
    
    var body: some View {
        
        VStack(spacing: 0){
            
            // Video Player...
            
            HStack {
                VideoPlayerView()
                    .frame(width: player.isMiniPlyer ? 150 : player.width,height: player.isMiniPlyer ? 70 : getFrame())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
            
                // Controls...
                VideoContorls()
            )
            
            GeometryReader{reader in
                
                ScrollView {
                    VStack(spacing: 18){
                        
                        // Video Playback Details And Buttons....
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("M1 MacBook Unboxing And First Impressions")
                                .font(.callout)
                            
                            Text("1.2M Views")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Buttons....
                        
                        HStack{
                            
                            PlayBackVideoButtons(image: "hand.thumbsup", text: "123K")
                            
                            PlayBackVideoButtons(image: "hand.thumbsdown", text: "1K")
                            
                            PlayBackVideoButtons(image: "square.and.arrow.up", text: "Share")
                            
                            PlayBackVideoButtons(image: "square.and.arrow.down", text: "Download")
                            
                            PlayBackVideoButtons(image: "message", text: "Live Chat")
                        }
                        
                        Divider()

                        ForEach(videos){video in
                                
                            // Video Card View...
                            VideoCardView(video: video)
                        }
                    }
                    .padding()
                }
                .onAppear(perform: {
                    player.height = reader.frame(in: .global).height + 250
                })
            }
            .background(Color.white)
            .opacity(player.isMiniPlyer ? 0 : getOpacity())
            .frame(height: player.isMiniPlyer ? 0 : nil)
        }
        .background(
        
            Color.white
                .ignoresSafeArea(.all, edges: .all)
                .onTapGesture {
                    withAnimation{
                        player.width = UIScreen.main.bounds.width
                        player.isMiniPlyer.toggle()
                    }
                }
        )
    }
    
    // Getting Frame And Opacity While Dragging
    
    func getFrame()->CGFloat{
        
        let progress = player.offset / (player.height - 100)
        
        if (1 - progress) <= 1.0{
         
            let videoHeight : CGFloat = (1 - progress) * 250
            
            // stopping height at 70...
            if videoHeight <= 70{
                
                // Decresing Width...
                let percent = videoHeight / 70
                let videoWidth : CGFloat = percent * UIScreen.main.bounds.width
                DispatchQueue.main.async {
                    // Stopping At 150...
                    if videoWidth >= 150{
                    
                        player.width = videoWidth
                    }
                }
                return 70
            }
            // Preview WIll Have Animation Problems...
            DispatchQueue.main.async {
                player.width = UIScreen.main.bounds.width
            }
            
            return videoHeight
        }
        return 250
    }
    
    func getOpacity()->Double{
        
        let progress = player.offset / (player.height)
        if progress <= 1{
            return Double(1 - progress)
        }
        return 1
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PlayBackVideoButtons: View {
    var image: String
    var text: String
    var body: some View {
        Button(action: {}, label: {
            VStack(spacing: 8){
                
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

struct VideoContorls: View {
    
    @EnvironmentObject var player: VideoPlayerViewModel
    
    var body: some View{
        
        HStack(spacing: 15){
            
            // Video View...
            Rectangle()
                .fill(Color.clear)
                .frame(width: 150, height: 70)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text("M1 MacBook Unboxing And First Impressions")
                    .font(.callout)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Text("Kavsoft")
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundColor(.gray)
            })

            
            Button(action: {}, label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            })
            
            Button(action: {
                //withAnimation{
                    player.showPlayer.toggle()
                    player.offset = 0
                    player.isMiniPlyer.toggle()
                //}
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            })
        }
        .padding(.trailing)
    }
}
