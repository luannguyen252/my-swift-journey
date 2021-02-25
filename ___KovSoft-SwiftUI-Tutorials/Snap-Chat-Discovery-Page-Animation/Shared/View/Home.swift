//
//  Home.swift
//  Snap (iOS)
//
//  Created by Balaji on 15/01/21.
//

import SwiftUI
import AVKit

struct Home: View {
    // For Getting Dark Mode Or Light...
    @Environment(\.colorScheme) var scheme
    
    // Columns...
    let colums = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    // Animation NameSpace...
    @Namespace var animation
    
    @StateObject var playerModel = VideoPlayerViewModel()
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0){
                
                HStack{
                    
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.pink)
                    })
                    
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    })
                    
                    Spacer()
                    
                    
                    Button(action: {}, label: {
                        Image(systemName: "person.fill.badge.plus")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    })
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                .overlay(
                
                    Text("Discover")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                )
                // Shadow.....
                .background(scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: 5)
                
                ScrollView{
                    
                    LazyVGrid(columns: colums,spacing: 8, content: {

                        // Code Updated For Ram Usage...
                        ForEach(videos){video in
                            
                            ZStack{
                                
                                if playerModel.showPlayer && playerModel.selectedVideo.id == video.id{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.clear)
                                }
                                else{
                                    VideoPlayerView(player: video.player)
                                        .cornerRadius(15)
                                        .matchedGeometryEffect(id: video.id, in: animation)
                                }
                            }
                            .scaleEffect(playerModel.showPlayer && playerModel.selectedVideo.id == video.id ? playerModel.scale : 1)
                            // Horizontal Spacing And Spacing Between Items...
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2,height: 280)
                            .onTapGesture {
                                withAnimation{
                                    playerModel.selectedVideo = video
                                    playerModel.showPlayer = true
                                }
                            }
                            .zIndex(0)
                        }
                    })
                    .padding()
                }
            }
            
            if playerModel.showPlayer{
                
                VideoPlayerView(player: playerModel.selectedVideo.player)
                    .cornerRadius(15)
                    .scaleEffect(playerModel.scale)
                    .matchedGeometryEffect(id: playerModel.selectedVideo.id, in: animation)
                    .offset(playerModel.offset)
                    .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
                    // Playing Video When Opens...
                    .onAppear(perform: {
                        playerModel.selectedVideo.player.play()
                    })
                    .ignoresSafeArea(.all, edges: .all)
                    .zIndex(3)
                // Dragging....
            }
        }
    }
    
    func onChanged(value: DragGesture.Value){
        
        // Only Moving View When Swipes Down....
        if value.translation.height > 0{
            
            playerModel.offset = value.translation
            
            // Scaling View....
            
            let screenHeight = UIScreen.main.bounds.height - 50
            
            let progress = playerModel.offset.height / screenHeight
            
            // only if > 0.5...
            if 1 - progress > 0.5{
            
                playerModel.scale = 1 - progress
            }
        }
    }
    
    func onEnd(value: DragGesture.Value){
        
        // Resetting View...
        withAnimation(.default){
            
            // Checking And Closing View...
            if value.translation.height > 300{
                // Stop Playing Video...
                playerModel.selectedVideo.player.pause()
                playerModel.showPlayer = false
            }
            
            playerModel.offset = .zero
            playerModel.scale = 1
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
