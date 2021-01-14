//
//  AVPlayerView.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import SwiftUI
import AVKit

struct AVPlayerView: UIViewControllerRepresentable {
    
    // MARK: Properties
    
    var sourceURL: URL? 
    
    
    // MARK: Public functions
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AVPlayerView>) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        playerViewController.allowsPictureInPicturePlayback = false
        playerViewController.showsPlaybackControls = false
        // loop
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { [weak playerViewController] _ in
            playerViewController?.player?.seek(to: .zero)
            playerViewController?.player?.play()
        }
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<AVPlayerView>) {
        setSourceURL(for: uiViewController, url: sourceURL)
    }
    
    
    // MARK: Private methods
    
    func setSourceURL(for playerViewController: AVPlayerViewController, url: URL?) {
        playerViewController.player?.pause()
        if let url = url {
            let asset = AVURLAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            playerViewController.player = AVPlayer(playerItem: playerItem)
            playerViewController.player?.play()
            
        } else {
            playerViewController.player = nil
        }
    }
    
}
