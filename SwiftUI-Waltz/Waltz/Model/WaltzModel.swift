//
//  WaltzModel.swift
//  Waltz
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI
import AVKit

class WaltzModel: ObservableObject {
    // MARK: - PROPERTIES
    var audioPlayer: AVAudioPlayer?
    
    // MARK: - LOADING MUSIC
    func loadMusic() {
        if let filePath = Bundle.main.path(forResource: "Waltz of the Flowers", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - LOAD AND PLAY
    func loadAndPlay() {
        self.loadMusic()
        self.playMusic()
    }
    
    // MARK: - PLAY
    func playMusic() {
        audioPlayer?.play()
        audioPlayer?.numberOfLoops = 0
    }
    
    // MARK: - PAUSE
    func pauseMusic() {
        audioPlayer?.pause()
    }
    
    // MARK: - STOP
    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}
