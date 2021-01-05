//
//  Photo3DObjectAnchor.swift
//  ARSocialPhotoApp
//
//  Created by sergio on 09/06/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import UIKit
import ARKit

class Photo3DObjectAnchor: ARAnchor {

    func make3DBodyNode() -> SCNNode? {
        guard let bodyScene = SCNScene(named: "ARAssets.scnassets/3DBody/3DBody.dae")
            else { return nil }
        let node = bodyScene.rootNode.childNode(withName: "model", recursively: true)
        node?.name = "rootNode"
        return node
    }
}
