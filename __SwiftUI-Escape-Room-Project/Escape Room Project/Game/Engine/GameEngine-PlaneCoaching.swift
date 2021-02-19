//
//  GameEngine-ARSessionDelegate.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import ARKit
import RealityKit

struct Plane {
    var anchor: ARPlaneAnchor
    var anchorEntity: AnchorEntity
    var entity: ModelEntity
}

/// Adds plane coaching planes and tracks their position to allow the player to pick where to place objects
extension GameEngine: ARSessionDelegate {
    
    func addPlane(for anchor: ARPlaneAnchor) {
        let planeEntity = addPlaneEntity(for: anchor)
        updatePlaneEntity(planeEntity.entity, for: anchor)
        let plane = Plane(anchor: anchor, anchorEntity: planeEntity.anchorEntity, entity: planeEntity.entity)
        planes.append(plane)
    }
    
    func addPlaneEntity(for anchor: ARPlaneAnchor) -> (anchorEntity: AnchorEntity, entity: ModelEntity) {
        let planeMesh = MeshResource.generatePlane(width: 0, depth: 0)
        
        let planeEntity = ModelEntity(mesh: planeMesh)
        planeEntity.model?.materials = [SimpleMaterial(color: UIColor.green.withAlphaComponent(0.5), isMetallic: false)]
        planeEntity.generateCollisionShapes(recursive: true)
        
        let anchorEntity = AnchorEntity(anchor: anchor)
        anchorEntity.addChild(planeEntity)
        
        arView?.scene.addAnchor(anchorEntity)
        return (anchorEntity: anchorEntity, entity: planeEntity)
    }
    
    private func updatePlaneEntity(_ planeEntity: ModelEntity, for anchor: ARPlaneAnchor) {
        let position = anchor.transform.toTranslation()
        let orientation = anchor.transform.toQuaternion()
        let rotatedCenter = orientation.act(anchor.center)
        
        planeEntity.transform.translation = position + rotatedCenter
        planeEntity.transform.rotation = orientation
        
        planeEntity.model?.mesh = MeshResource.generatePlane(
            width: anchor.extent.x,
            depth: anchor.extent.z
        )
        
        planeEntity.collision = nil
        planeEntity.generateCollisionShapes(recursive: true)
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard state == .planeCoaching else { return }
        
        let planeAnchors = anchors.compactMap { $0 as? ARPlaneAnchor }
        for planeAnchor in planeAnchors {
            let extent = simd_length(planeAnchor.extent)
            guard extent > 0.5 else { continue }
            
            addPlane(for: planeAnchor)
        }
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard state == .planeCoaching else { return }
        
        let planeAnchors = anchors.compactMap { $0 as? ARPlaneAnchor }
        for planeAnchor in planeAnchors {
            let extent = simd_length(planeAnchor.extent)
            guard extent > 0.5 else { continue }
            
            let existingPlanes = planes.enumerated().filter { $0.element.anchor.identifier == planeAnchor.identifier }
            if let existingPlane = existingPlanes.first {
                let entity = existingPlane.element.entity
                updatePlaneEntity(entity, for: planeAnchor)
                planes[existingPlane.offset] = Plane(anchor: planeAnchor, anchorEntity: existingPlane.element.anchorEntity, entity: entity)
            } else {
                addPlane(for: planeAnchor)
            }
        }
    }
    
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
        let anchorIdentifiers = anchors.map { $0.identifier }
        planes
            .filter { plane in anchorIdentifiers.contains(plane.anchor.identifier) }
            .forEach { plane in
                plane.entity.removeFromParent()
        }
        planes.removeAll { plane in anchorIdentifiers.contains(plane.anchor.identifier) }
    }
}
