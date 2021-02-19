//
//  InsideTheBoxClue.swift
//  Created by Julian Schiavo on 14/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Combine
import RealityKit
import UIKit

public class MorseCodeClue: Clue {
    public let id = "morsecode"
    public let supportsAdditionalHelp = true
    public let containsEducationalContent = true
    
    public var parentEntity: Entity?
    
    public let tip = "Listen for the hidden word."
    public let hint = "Use the resources provided to decode what you hear."
    
    public let answerType = AnswerType.default
    public let answers = ["ui", "user interface"]
    
    private var anyCancellable: AnyCancellable?
    private var audioPlaybackController: AudioPlaybackController?
    
    private var additionalHelpEntities = [Entity?]()
    private var isAdditionalHelpShown = false
    
    public func load() throws {
        let entity = try Experience.loadMorseCode()
        additionalHelpEntities = [entity.fixedSlab, entity.fixedText]
        parentEntity = entity
    }
    
    public func sceneLoaded() {
        // If audio is disabled by the user, show the additional help entities immediately
        if GameEngine.current.isAudioEnabled, !isAdditionalHelpShown {
            additionalHelpEntities.forEach { $0?.isEnabled = false }
        } else {
            showAdditionalHelp()
        }
        
        guard GameEngine.current.isAudioEnabled else { return }
        finish()
        
        // Loads and plays the morse code audio on repeat
        anyCancellable = AudioFileResource.loadAsync(named: "morsecode.wav", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: true)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure:
                    self.showAdditionalHelp()
                case .finished: return
                }
            }, receiveValue: { resource in
                self.audioPlaybackController = self.parentEntity?.findEntity(named: "fixed-sound")?.prepareAudio(resource)
                self.audioPlaybackController?.play()
            })
    }
    
    public func finish() {
        // Release all the audio resources and players to free up memory and avoid issues
        audioPlaybackController?.pause()
        audioPlaybackController?.stop()
        audioPlaybackController = nil
        anyCancellable?.cancel()
        anyCancellable = nil
    }
    
    public func showAdditionalHelp() {
        isAdditionalHelpShown = true
        additionalHelpEntities.forEach { $0?.isEnabled = true }
    }
}
