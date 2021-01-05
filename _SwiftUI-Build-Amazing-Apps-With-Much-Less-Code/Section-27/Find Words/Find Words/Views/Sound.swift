//
//  Sound.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/9/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        player?.play()
        
        } catch {
            print("Could not load audio file")
        }
    }
}
