//
//  GameEngine-Gestures.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import RealityKit
import UIKit

extension GameEngine {
    /// Handles tap gestures to select a plane on which to place AR objects or to support taps on clues
    @objc func handleTap(_ tapGestureRecognizer: UITapGestureRecognizer?) {
        guard let arView = arView, let touchInView = tapGestureRecognizer?.location(in: arView) else { return }
        let hitEntities = arView.entities(at: touchInView)
        
        guard state == .planeCoaching else {
            currentClue.entitiesTapped(hitEntities)
            return
        }
        
        guard let hitEntity = hitEntities.first, let plane = planes.first(where: { $0.entity == hitEntity }) else {
            return
        }
        
        planes.forEach { plane in
            plane.entity.removeFromParent()
        }
        selectedPlane = plane
    }
}
