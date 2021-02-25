//
//  Home.swift
//  Youtube Transition (iOS)
//
//  Created by Balaji on 13/01/21.
//

import SwiftUI

struct Home: View {
    
    @StateObject var player = VideoPlayerViewModel()
    // Gesture State to avoid Drag Gesture Glitches...
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            ScrollView{
                
                VStack(spacing: 15){
                    
                    ForEach(videos){video in
                        
                        // Video Card View...
                        VideoCardView(video: video)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation{
                                    player.showPlayer = true
                                }
                            }
                    }
                }
            }
            
            // Video Player View....
            
            if player.showPlayer{
                MiniPlayer()
                // Move From Bottom...
                    .transition(.move(edge: .bottom))
                    .offset(y: player.offset)
                    .gesture(DragGesture().updating($gestureOffset, body: { (value, state, _) in
                        
                        state = value.translation.height
                    })
                    .onEnded(onEnd(value:)))
            }
        })
        .onChange(of: gestureOffset, perform: { value in
            onChanged()
        })
        // Setting Environment Obj
        .environmentObject(player)
    }
    
    func onChanged(){
        
        if gestureOffset > 0 && !player.isMiniPlyer && player.offset + 70 <= player.height{
        
            player.offset = gestureOffset
        }
    }
    
    func onEnd(value: DragGesture.Value){
        withAnimation(.default){

            if !player.isMiniPlyer{
                
                player.offset = 0
                
                // Closing View...
                if value.translation.height > UIScreen.main.bounds.height / 3{
                    
                    player.isMiniPlyer = true
                }
                else{
                    player.isMiniPlyer = false
                }
            }
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
