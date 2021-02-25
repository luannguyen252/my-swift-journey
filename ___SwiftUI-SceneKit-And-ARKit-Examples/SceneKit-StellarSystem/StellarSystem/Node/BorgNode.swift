//
//  BorgNode.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/07.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import SceneKit

final class BorgNode: SCNNode {
    convenience init(position p: SCNVector3) {
        self.init()
        position = p
        geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        
        if let noiseImage = UIImage(named: "noise") {
            geometry?.firstMaterial?.setValue(SCNMaterialProperty(contents: noiseImage), forKey: "noiseTexture")
        }
        
        geometry?.firstMaterial?.shaderModifiers = [.fragment: appearingFragmentShader]
        
        let revealAnimation = CABasicAnimation(keyPath: "revealage")
        revealAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        revealAnimation.beginTime = CACurrentMediaTime() + 5
        revealAnimation.duration = 2.5
        revealAnimation.fromValue = 0.0
        revealAnimation.toValue = 1.0
        revealAnimation.fillMode = .forwards
        revealAnimation.isRemovedOnCompletion = false
        
        let scnRevealAnimation = SCNAnimation(caAnimation: revealAnimation)
        geometry?.firstMaterial?.addAnimation(scnRevealAnimation, forKey: "Reveal")
        
        castsShadow = false
        geometry?.firstMaterial?.lightingModel = .constant
        addRotationAnimation(duration: 20.0, from: NSValue(scnVector4: SCNVector4Make(0, 1, 0, 0)), to: NSValue(scnVector4: SCNVector4Make(0, 1, 0, Float(Double.pi) * 2.0)), key: "borg rotation")
    }
}
