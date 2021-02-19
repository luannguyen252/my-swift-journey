//
//  Float4x4-Helpers.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import ARKit

/// Helper methods used for the plane coaching state
public extension float4x4 {
    func toTranslation() -> SIMD3<Float> {
        return [self[3,0], self[3,1], self[3,2]]
    }
    
    func toQuaternion() -> simd_quatf {
        return simd_quatf(self)
    }
}
