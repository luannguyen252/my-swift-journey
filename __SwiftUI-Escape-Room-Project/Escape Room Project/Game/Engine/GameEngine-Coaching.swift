//
//  GameEngine-Coaching.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import ARKit
import SwiftUI

/// Manages coaching events and transitions
extension GameEngine: ARCoachingOverlayViewDelegate {
    func coachingStarted() {
        changeState(to: .coaching)
    }
    
    func coachingFinished() {
        planeCoachingStarted()
    }
    
    func planeCoachingStarted() {
        changeState(to: .planeCoaching)
    }
    
    func planeCoachingFinished() {
        changeState(to: .playing)
    }
    
    // MARK: - ARCoachingOverlayViewDelegate
    
    func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingStarted()
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingFinished()
    }
}
