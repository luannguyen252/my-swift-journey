//
//  SunLightNode.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/07.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import SceneKit

final class SunLightNode: SCNNode {
    convenience init(angle: Float) {
        self.init()
        castsShadow = false
        light = SCNLight()
        light?.castsShadow = true
        light?.type = .spot
        light?.color = UIColor.white
        light?.spotInnerAngle = 0
        light?.spotOuterAngle = 90
        position = SCNVector3(0, 0, 0)
        orientation = SCNQuaternion(0, 0, 0, 0)
        addRotationAnimation(duration: 20.0, from: NSValue(scnVector4: SCNVector4Make(0, 1, 0, angle)), to: NSValue(scnVector4: SCNVector4Make(0, 1, 0, angle + Float(Double.pi) * 2.0)), key: "sun light rotation \(angle)")
    }
}
