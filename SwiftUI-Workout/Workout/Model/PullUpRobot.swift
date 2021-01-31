//
//  PullUpRobot.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

class PullUpRobot: ObservableObject {
    // MARK: - PROPERTIES
    @Published var completedPullUps: Int = 0
    
    // MARK: - ADD PULL UP
    func addOnePullUp() {
        completedPullUps = completedPullUps + 1
        print(completedPullUps)
        generateHapticFeedback()
    }
    
    // MARK: - RESET PULL UP
    func resetPullUps() {
        completedPullUps = 0
        print(completedPullUps)
        generateHapticFeedback()
    }
    
    // MARK: - GENERATE HAPTIC FEEDBACK
    func generateHapticFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
