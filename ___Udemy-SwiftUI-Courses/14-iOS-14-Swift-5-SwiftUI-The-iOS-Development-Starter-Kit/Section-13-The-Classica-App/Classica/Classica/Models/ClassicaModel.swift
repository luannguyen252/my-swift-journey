//
//  ClassicaModel.swift
//  Classica
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI
import AVKit

class ClassicaModel: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    
    func loadMusic(fileName: String, fileType: String) {
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
            let fileURL = URL(fileURLWithPath: filePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            } catch {
                print("Error: File not found.")
            }
        }
    }
    
    func loadAndPlay(song: String, fileType: String) {
        self.loadMusic(fileName: song, fileType: fileType)
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
