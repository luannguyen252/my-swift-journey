//
//  PlaySound.swift
//  LearnByDoing
//
//  Created by Sandesh on 22/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?


func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play sound file")
        }
    }
}
