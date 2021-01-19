//
//  TextToSpeechProcessor.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 17.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import Foundation
import AVFoundation

class TextToSpeechProcessor: NSObject {
  
  private let synthesizer = AVSpeechSynthesizer()
  private let settings = Settings()
  
  func speechText(_ text: String) {
    let utterance = AVSpeechUtterance(string: text)
    if let voiceId = settings.currentKeyboard?.voiceId, let voice = AVSpeechSynthesisVoice(identifier: voiceId) {
      utterance.voice = voice
    }
    synthesizer.speak(utterance)
  }
}
