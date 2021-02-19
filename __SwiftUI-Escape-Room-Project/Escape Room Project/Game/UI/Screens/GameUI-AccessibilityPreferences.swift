//
//  GameUI-AccessibilityPreferences.swift
//  Created by Julian Schiavo on 14/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import AVFoundation
import SwiftUI

extension GameUI {
    struct AccessibilityPreferences: View {
        private class ObservationRetainer {
            var observation: NSKeyValueObservation?
        }
        
        private let buttonFont = Font.system(.headline, design: .rounded)
        private let buttonColor = Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255)
        
        @State private var isCurrentVolumeBelowThreshold = false
        private let observationRetainer = ObservationRetainer()
        
        private func startObservingVolumeLevel() {
            let audioSession = AVAudioSession.sharedInstance()
            try? audioSession.setActive(true)
            observationRetainer.observation = audioSession.observe(\.outputVolume, options: [.initial, .new]) { audioSession, change in
                guard let volume = change.newValue else { return }
                self.isCurrentVolumeBelowThreshold = volume < 0.4
            }
        }
        
        private func stopObservingVolumeLevel() {
            self.observationRetainer.observation = nil
            try? AVAudioSession.sharedInstance().setActive(false)
        }
        
        public var body: some View {
            VStack {
                Spacer()
                content
                Spacer()
                buttons
            }
            .onAppear(perform: startObservingVolumeLevel)
            .onDisappear(perform: stopObservingVolumeLevel)
            .padding([.bottom, .leading, .trailing], 30)
        }
        
        private var content: some View {
            VStack(spacing: 20) {
                Spacer().frame(height: 40)
                Image(systemName: "speaker.3.fill")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.blue)
                Text("Accessibility & Audio")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("This game uses an immersive audio experience that is necessary to progress. Make sure that your device's volume is raised. You are recommended to wear headphones for the best experience.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                if isCurrentVolumeBelowThreshold {
                    Text("Your current volume level is below the recommended level.")
                        .font(.headline)
                        .foregroundColor(.red)
                } else {
                    Text("Your current volume level is at the recommended level.")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                Text("You can disable audio for accessibility or other reasons by tapping Disable below, which will use an alternative experience.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: 500)
        }
        
        private var buttons: some View {
            VStack(spacing: 15) {
                continueButton
                disableButton
            }
        }
        
        private var continueButton: some View {
            Button(action: {
                self.stopObservingVolumeLevel()
                GameEngine.current.isAudioEnabled = true
                GameEngine.current.changeState(to: .notPlaying)
            }) {
                Text("Continue with Audio Experiences")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.regular)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
        }
        
        private var disableButton: some View {
            Button(action: {
                self.stopObservingVolumeLevel()
                GameEngine.current.isAudioEnabled = false
                GameEngine.current.changeState(to: .notPlaying)
            }) {
                Text("Disable Audio Experiences")
                    .foregroundColor(.red)
                    .font(.headline)
                    .fontWeight(.regular)
                    .padding(5)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
