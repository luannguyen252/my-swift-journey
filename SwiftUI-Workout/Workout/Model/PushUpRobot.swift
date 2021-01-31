//
//  PushUpRobot.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

class PushUpRobot: ObservableObject {
    // MARK: - PROPERTIES
    @Published var completedPushUps: Int = 0
    
    // MARK: - ADD PULL UP
    func addOnePushUp() {
        completedPushUps = completedPushUps + 1
        print(completedPushUps)
        generateHapticFeedback()
    }
    
    // MARK: - RESET PULL UP
    func resetPushUps() {
        completedPushUps = 0
        print(completedPushUps)
        generateHapticFeedback()
    }
    
    // MARK: - GENERATE HAPTIC FEEDBACK
    func generateHapticFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
