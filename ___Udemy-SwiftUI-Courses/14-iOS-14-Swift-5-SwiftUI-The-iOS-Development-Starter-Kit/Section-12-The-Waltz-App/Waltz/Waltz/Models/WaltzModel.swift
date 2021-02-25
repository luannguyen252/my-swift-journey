//
//  WaltzModel.swift
//  Waltz
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI
import AVKit

class WaltzModel: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    
    func loadMusic() {
        
        if let filePath = Bundle.main.path(forResource: "Waltz of the Flowers", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadAndPlay() {
        self.loadMusic()
        self.playMusic()
    }
    
    func playMusic() {
        audioPlayer?.play()
        audioPlayer?.numberOfLoops = 0
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
    }
    
    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
}

