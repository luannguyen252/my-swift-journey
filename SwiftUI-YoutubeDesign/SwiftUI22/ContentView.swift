//
//  ContentView.swift
//  SwiftUI22
//
//  Created by Rohit Saini on 30/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Color(.white).edgesIgnoringSafeArea(.all)
                VStack{
                    player().frame(height: UIDevice.current.orientation.isLandscape ? geo.size.height : geo.size.height / 3)
                    SubscriberCard()
                    if !UIDevice.current.orientation.isLandscape{
                        VideoList()
                    }
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct player:UIViewControllerRepresentable{
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let url = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
}

struct VideoList:View{
    var body: some View{
        List(0..<10){ _ in
            HStack{
                Image(systemName: "flame.fill").resizable().frame(width:100,height: 100).foregroundColor(.red).padding(5)
                VStack(alignment: .leading){
                    Text("Video").fontWeight(.bold).foregroundColor(.black)
                    Text("Description").fontWeight(.regular).foregroundColor(.gray)
                }
                Spacer()
            }
        }
    }
}
struct SubscriberCard:View{
    var body: some View{
        VStack{
            HStack{
                Image(systemName: "flame.fill").resizable().frame(width:40,height: 40).foregroundColor(.red).padding(5)
                VStack(alignment: .leading){
                    Text("YRF").fontWeight(.bold).foregroundColor(.black)
                    Text("3.23 crore subscribers").fontWeight(.regular).foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    print("Clicked")
                }) {
                    Text("SUBSCRIBE").fontWeight(.heavy).foregroundColor(.red)
                }
            .padding()
            }
        }
    }
}

