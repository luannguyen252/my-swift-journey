//
//  SphereNode.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/07.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import SceneKit

final class SphereNode: SCNNode {
    convenience init(_ imageName: String,
                     castsShadow: Bool = false,
                     radius: CGFloat,
                     lightningModel: SCNMaterial.LightingModel = .lambert,
                     duration: CFTimeInterval = 4.0,
                     position: SCNVector3 = SCNVector3Make(0, 0, 0)) {
        self.init()
        geometry = SCNSphere(radius: radius)
        geometry?.firstMaterial?.diffuse.contents = UIImage(named: imageName)
        self.castsShadow = castsShadow
        self.position = position
        geometry?.firstMaterial?.lightingModel = lightningModel
        addRotationAnimation(duration: duration, from: NSValue(scnVector4: SCNVector4Make(0, 1, 0, 0)), to: NSValue(scnVector4: SCNVector4Make(0, 1, 0, Float(Double.pi) * 2.0)), key: "sphere \(imageName) rotation")
    }
}

final class SphereGroupNode: SCNNode {
    convenience init(sphereNodes: [SCNNode], position: SCNVector3) {
        self.init()
        castsShadow = false
        self.position = position
        sphereNodes.forEach { (sphereNode) in
            addChildNode(sphereNode)
        }
    }
}

final class PlanetRotationNode: SCNNode {
    convenience init(angle: Float = 0.0) {
        self.init()
        castsShadow = false
        position = SCNVector3(0, 0, 0)
        addRotationAnimation(duration: 20, from: NSValue(scnVector4: SCNVector4Make(0, 2, 1, angle)), to: NSValue(scnVector4: SCNVector4Make(0, 2, 1, angle + Float(Double.pi) * 2.0)), key: "planet rotation around the sun \(angle)")
    }
}

final class SatelliteRotationNode: SCNNode {
    convenience init(satelliteNode: SCNNode) {
        self.init()
        // Satellite-rotation (center of rotation of the Satellite around the Planet)
        castsShadow = false
        addChildNode(satelliteNode)
        // Rotate the satellite around the planet
        addRotationAnimation(duration: 20.0, from: NSValue(scnVector4: SCNVector4Make(0, 2, 1, 0)), to: NSValue(scnVector4: SCNVector4Make(0, 2, 1, Float(Double.pi) * 2.0)), key: "satellite rotation around planet")
    }
}
