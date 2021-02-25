//
//  VideoPlayerView.swift
//  Youtube Transition (iOS)
//
//  Created by Balaji on 13/01/21.
//

import SwiftUI
import AVKit

// I'm going to use UIKit Video Plyer since SwiftUI Video Player is not having enough features....
struct VideoPlayerView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        // Video URL...
        let bundle_url = Bundle.main.path(forResource: "video", ofType: "mp4")
        let video_url = URL(fileURLWithPath: bundle_url!)
        
        // Player...
        let player = AVPlayer(url: video_url)
        
        controller.player = player
        
        // Hiding Controls....
        controller.showsPlaybackControls = false
        controller.player?.play()
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        
    }
}

