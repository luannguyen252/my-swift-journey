//
//  GameUI-HeatWarning.swift
//  Escape Room Project
//
//  Created by Julian Schiavo on 17/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Combine
import SwiftUI

extension GameUI {
    struct HeatWarning: View {
        private let buttonFont = Font.system(.headline, design: .rounded)
        private let buttonColor = Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255)
        
        @State private var isCheckAlertShown = false
        
        private var thermalState: ProcessInfo.ThermalState {
            ProcessInfo.processInfo.thermalState
        }
        
        private var heatLevelText: String {
            switch thermalState {
            case .serious: return "very hot"
            case .critical: return "extremely hot"
            default: return ""
            }
        }
        
        private var thermalStatePublisher: NotificationCenter.Publisher {
            NotificationCenter.default.publisher(for: ProcessInfo.thermalStateDidChangeNotification)
        }
        
        public var body: some View {
            VStack {
                Spacer()
                content
                Spacer()
                buttons
            }
            .padding([.bottom, .leading, .trailing], 30)
            .onReceive(thermalStatePublisher) { _ in
                guard self.thermalState == .fair || self.thermalState == .nominal else { return }
                GameEngine.current.changeState(to: .notPlaying)
            }
            .alert(isPresented: $isCheckAlertShown) {
                Alert(title: Text("Your device is still hot"), message: Text("You can choose to ignore this warning and play immediately by tapping the Ignore Warning button, but this may result in a worse game experience."))
            }
        }
        
        private var content: some View {
            VStack(spacing: 20) {
                Spacer().frame(height: 40)
                Image(systemName: "thermometer")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.red)
                Text("Heat Warning")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text("Your device is \(heatLevelText). You are strongly recommended to wait for your device to cool down for the best AR experience and game performance.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Text("Wait for your device to cool down and then tap Check Again below. You can choose to ignore this warning and play immediately by tapping Ignore Warning below, but this may result in a worse game experience.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: 500)
        }
        
        private var buttons: some View {
            VStack(spacing: 15) {
                checkButton
                ignoreButton
            }
        }
        
        private var checkButton: some View {
            Button(action: {
                if self.thermalState == .fair || self.thermalState == .nominal {
                    GameEngine.current.changeState(to: .notPlaying)
                } else {
                    self.isCheckAlertShown.toggle()
                }
            }) {
                Text("Check Again")
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
        
        private var ignoreButton: some View {
            Button(action: {
                GameEngine.current.changeState(to: .notPlaying)
            }) {
                Text("Ignore Warning")
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
