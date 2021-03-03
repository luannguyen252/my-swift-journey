//
//  ImageView.swift
//  Image_Viewer (iOS)
//
//  Created by Balaji on 01/03/21.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var homeData: HomeViewModel
    // since onChnage has a problem in Drag Gesture....
    @GestureState var draggingOffset: CGSize = .zero
    var body: some View {
        
        ZStack{
            
            if homeData.showImageViewer{
                
                Color("bg")
                    .opacity(homeData.bgOpacity)
                    .ignoresSafeArea()

                // Tab View Has a problem in ignroing edges...
                ScrollView(.init()){
                    
                    TabView(selection: $homeData.selectedImageID){
                        
                        ForEach(homeData.allImages,id: \.self){image in
                            
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tag(image)
                                .scaleEffect(homeData.selectedImageID == image ? (homeData.imageScale > 1 ? homeData.imageScale : 1) : 1)
                            // Moving Only Image...
                            // For SMooth Animation...
                                .offset(y: homeData.imageViewerOffset.height)
                                .gesture(
                                
                                    // Magnifying Gesture...
                                    MagnificationGesture().onChanged({ (value) in
                                        homeData.imageScale = value
                                    }).onEnded({ (_) in
                                        withAnimation(.spring()){
                                            homeData.imageScale = 1
                                        }
                                    })
                                    // To avoid scroll while scaling
                                    .simultaneously(with: DragGesture(minimumDistance: homeData.imageScale == 1 ? 10000 : 0))
                                    // Double To Zoom...
                                    .simultaneously(with: TapGesture(count: 2).onEnded({
                                        withAnimation{
                                            homeData.imageScale = homeData.imageScale > 1 ? 1 : 4
                                        }
                                    }))
                                )
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
                .ignoresSafeArea()
                .overlay(
                
                    // CLose Button...
                    Button(action: {
                        withAnimation(.default){
                            // Removing All.....
                            homeData.showImageViewer.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.35))
                            .clipShape(Circle())
                    })
                    .padding(10)
                    .opacity(homeData.bgOpacity)
                    
                    ,alignment: .topTrailing
                )
                .transition(.move(edge: .bottom))
            }
        }
        .gesture(DragGesture().updating($draggingOffset, body: { (value, outValue, _) in
            
            outValue = value.translation
            homeData.onChange(value: draggingOffset)
            
        }).onEnded(homeData.onEnd(value:)))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
