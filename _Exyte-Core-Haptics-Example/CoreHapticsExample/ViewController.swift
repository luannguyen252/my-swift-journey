//
//  ViewController.swift
//  CoreHapticsExample
//
//  Created by Dmitry Shipinev on 10.02.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import UIKit
import CoreHaptics

final class ViewController: UIViewController {
    
    private var engine: CHHapticEngine!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let hapticTransientButton = UIButton(type: .system)
        hapticTransientButton.setTitle("Haptic Transient", for: [])
        hapticTransientButton.addTarget(self, action: #selector(playHapticTransient), for: .touchUpInside)
        
        let hapticContinuousButton = UIButton(type: .system)
        hapticContinuousButton.setTitle("Haptic Continuous", for: [])
        hapticContinuousButton.addTarget(self, action: #selector(playHapticContinuous), for: .touchUpInside)
        
        let hapticTransientWithParametersButton = UIButton(type: .system)
        hapticTransientWithParametersButton.setTitle("Haptic Transient with random parameters", for: [])
        hapticTransientWithParametersButton.addTarget(self, action: #selector(playHapticTransientWithParameters), for: .touchUpInside)
        
        let hapticContinuousWithParametersButton = UIButton(type: .system)
        hapticContinuousWithParametersButton.setTitle("Haptic Continuous with random parameters", for: [])
        hapticContinuousWithParametersButton.addTarget(self, action: #selector(playHapticContinuousWithParameters), for: .touchUpInside)
        
        let audioContinuousButton = UIButton(type: .system)
        audioContinuousButton.setTitle("Audio Continuous", for: [])
        audioContinuousButton.addTarget(self, action: #selector(playAudioContinuous), for: .touchUpInside)
        
        let audioCustomButton = UIButton(type: .system)
        audioCustomButton.setTitle("Audio Custom", for: [])
        audioCustomButton.addTarget(self, action: #selector(playAudioCustom), for: .touchUpInside)
        
        let audioCustomWithHapticFeedbackButton = UIButton(type: .system)
        audioCustomWithHapticFeedbackButton.setTitle("Audio Custom with Haptic Feedback", for: [])
        audioCustomWithHapticFeedbackButton.addTarget(self, action: #selector(playAudioCustomWithHapticFeedback), for: .touchUpInside)
        
        stackView.addArrangedSubview(hapticTransientButton)
        stackView.addArrangedSubview(hapticTransientWithParametersButton)
        stackView.addArrangedSubview(hapticContinuousButton)
        stackView.addArrangedSubview(hapticContinuousWithParametersButton)
        stackView.addArrangedSubview(audioContinuousButton)
        stackView.addArrangedSubview(audioCustomButton)
        stackView.addArrangedSubview(audioCustomWithHapticFeedbackButton)
        
        do {
            engine = try CHHapticEngine()
        } catch let error {
            dump(error)
        }
    }

    @objc private func playAudioCustomWithHapticFeedback() throws {
        guard let url = Bundle.main.url(forResource: "audio", withExtension: "wav") else {
            return
        }
        let resourceId = try engine.registerAudioResource(url, options: [:])
        
        let kickParams = [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: 1),
            CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        ]
        let rhythmParams = [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.9),
            CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        ]
        
        var events = [
            CHHapticEvent(audioResourceID: resourceId, parameters: [], relativeTime: 0, duration: 15)
        ]
        
        events.append(contentsOf: createSection(0.2, parameters: rhythmParams))
        events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: kickParams, relativeTime: 4.4, duration: 0.3))
        events.append(contentsOf: createSection(4.4, parameters: rhythmParams))
        events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: kickParams, relativeTime: 8.8, duration: 0.3))
        events.append(contentsOf: createSection(8.8, parameters: rhythmParams))
        
        let pattern = try CHHapticPattern(events: events, parameters: [])
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }
    
    private func createSection(_ startTime: Double, parameters: [CHHapticEventParameter]) -> [CHHapticEvent] {
        let delay = 0.05
        let duration = 0.1
        let eventsCount = 28
        var events = [CHHapticEvent]()
        (0...eventsCount - 1).enumerated().forEach { index, _ in
            let relativeTime = startTime + ((duration + delay) * Double(index))
            events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: parameters, relativeTime: relativeTime, duration: duration))
        }
        return events
    }
    
    @objc private func playHapticTransient() throws {
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0)
        
        let pattern = try CHHapticPattern(events: [event], parameters: [])
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }
    
    @objc private func playHapticContinuous() throws {
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 0, duration: 0.5)
        
        let pattern = try CHHapticPattern(events: [event], parameters: [])
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }
    
    @objc private func playHapticTransientWithParameters() throws {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float.random(in: 0.1...1))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float.random(in: 0.1...1))
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        let pattern = try CHHapticPattern(events: [event], parameters: [])
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }
    
    @objc private func playHapticContinuousWithParameters() throws {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float.random(in: 0.1...1))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float.random(in: 0.1...1))
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.5)
        
        let pattern = try CHHapticPattern(events: [event], parameters: [])
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }
    
    @objc private func playAudioContinuous() throws {
        let event = CHHapticEvent(eventType: .audioContinuous, parameters: [], relativeTime: 0, duration: 1)
        let pattern = try CHHapticPattern(events: [event, ], parameters: [])
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }
    
    @objc private func playAudioCustom() throws {
        guard let url = Bundle.main.url(forResource: "confirmation", withExtension: "wav") else {
            return
        }
        let resourceId = try engine.registerAudioResource(url, options: [:])
        
        let pattern = try CHHapticPattern(
            events: [
                CHHapticEvent(audioResourceID: resourceId, parameters: [], relativeTime: 0),
                CHHapticEvent(eventType: .hapticContinuous, parameters: [
                    CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
                ], relativeTime: 0, duration: 0.6)
            ], parameters: [
                CHHapticDynamicParameter(parameterID: .hapticReleaseTimeControl, value: 0.7, relativeTime: 0)
            ]
        )
        let player = try engine.makePlayer(with: pattern)
        
        try engine.start()
        try player.start(atTime: 0)
    }

}
