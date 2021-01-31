//
//  TimerApp.swift
//  Shared
//
//  Created by Balaji on 27/01/21.
//

import SwiftUI

@main
struct TimerApp: App {
    @StateObject var data = TimerData()
    
    // Using scene phase for scene data
    @Environment(\.scenePhase) var scene
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
        .onChange(of: scene) { (newScene) in

            // Only for real device
            #if !targetEnvironment(simulator)
            if newScene == .background{
                // Storing time
                data.leftTime = Date()
            }
            
            if newScene == .active && data.leftTime != nil{
                // When it enter again checking the differnce
                let diff = Date().timeIntervalSince(data.leftTime)
                
                let currentTime = data.selectedTime - Int(diff)
                
                print(currentTime)
                
                if currentTime >= 0 {
                    withAnimation(.default) {
                        data.selectedTime = currentTime
                    }
                } else {
                    // Resetting view
                    data.resetView()
                }
            }
            #endif
        }
    }
}
