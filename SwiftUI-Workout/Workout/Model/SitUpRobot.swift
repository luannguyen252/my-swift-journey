//
//  SitUpRobot.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

class SitUpRobot: ObservableObject {
    // MARK: - PROPERTIES
    @Published var completedSitUps: Int = 0
    
    // MARK: - ADD SIT UP
    func addOneSitUp() {
        completedSitUps = completedSitUps + 1
        print(completedSitUps)
        generateHapticFeedback()
    }
    
    // MARK: - RESET SIT UP
    func resetSitUps() {
        completedSitUps = 0
        print(completedSitUps)
        generateHapticFeedback()
    }
    
    // MARK: - GENERATE HAPTIC FEEDBACK
    func generateHapticFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
