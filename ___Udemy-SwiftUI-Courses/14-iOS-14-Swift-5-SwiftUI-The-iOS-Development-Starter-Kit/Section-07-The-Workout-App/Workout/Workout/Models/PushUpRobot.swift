//
//  PushUpRobot.swift
//  Workout
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

class PushUpRobot: ObservableObject {
    
    @Published var completedPushUps: Int = 0
    
    func addOnePushUp() {
        completedPushUps = completedPushUps + 1
        print(completedPushUps)
        generateHapticFeedback()
    }
    
    func resetPushUps() {
        completedPushUps = 0
        print(completedPushUps)
        generateHapticFeedback()
    }
    
    func generateHapticFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
