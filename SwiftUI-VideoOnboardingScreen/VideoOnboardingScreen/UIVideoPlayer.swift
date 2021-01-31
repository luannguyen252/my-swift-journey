//
//  UIVideoPlayer.swift
//  VideoOnboardingScreen
//
//  Created by Luan Nguyen on 17/12/2020.
//

import AVKit
import SwiftUI

class UIVideoPlayer: UIView {
    // MARK: - PROPERTIES
    var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/luan-nguyen-design.appspot.com/o/VideoOnboardingScreen%2Fvideo.mp4?alt=media&token=c6aa80fb-aed5-48d4-b6ea-c4e221f79894") else { return }

        let player = AVPlayer(url: url)
        player.isMuted = true
        player.play()
      
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        
        layer.addSublayer(playerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct PlayerView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVideoPlayer {
        return UIVideoPlayer()
    }

    func updateUIView(_ uiView: UIVideoPlayer, context: Context) { }
}
