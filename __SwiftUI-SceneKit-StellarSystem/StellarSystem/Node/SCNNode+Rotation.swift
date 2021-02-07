//
//  SCNNode+Rotation.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/07.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import SceneKit

extension SCNNode {
    func addRotationAnimation(beginTime: CFTimeInterval = 0.0, duration: CFTimeInterval, from: NSValue, to: NSValue, key: String) {
        let animation = CABasicAnimation(keyPath: "rotation")
        animation.beginTime = beginTime
        animation.duration = duration
        animation.fromValue = from
        animation.toValue = to
        animation.repeatCount = .greatestFiniteMagnitude
        addAnimation(animation, forKey: key)
    }
}
