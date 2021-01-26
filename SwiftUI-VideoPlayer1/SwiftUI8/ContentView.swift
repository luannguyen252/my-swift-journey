//
//  ContentView.swift
//  SwiftUI8
//
//  Created by Rohit Saini on 05/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    var body: some View {
        VStack{
            player().frame(height: 300)
            Spacer()
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

