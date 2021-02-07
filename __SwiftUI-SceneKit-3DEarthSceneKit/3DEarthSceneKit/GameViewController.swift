//
//  ViewController.swift
//  3DEarth
//
//  Created by Bao Vu on 2/13/20.
//  Copyright © 2020 Bao Vu. All rights reserved.
//

import UIKit
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 3)
        
        scene.rootNode.addChildNode(lightNode)
        
        let earthNode = EarthNode()
        scene.rootNode.addChildNode(earthNode)
        
        let sceneView = self.view as! SCNView
        sceneView.scene = scene
        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.black
        sceneView.allowsCameraControl = true
    }


}
