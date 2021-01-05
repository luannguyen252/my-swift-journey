//
//  PhotoARSceneViewController.swift
//  ARSocialPhotoApp
//
//  Created by sergio on 08/06/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import UIKit
import ARKit

class PhotoARSceneViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var currentNode : SCNNode? = nil
    var lastTranslation : CGPoint = CGPoint.zero
    
    var pictures : [UUID : SCNNode] = [:]
    var planes : [UUID : SCNNode] = [:]
    
    var useGrid : Bool = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.isLightEstimationEnabled = true
        
        sceneView.delegate = self
        sceneView.antialiasingMode = .multisampling4X
        sceneView.session.run(configuration)
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
        
        #if DEBUG
        //-- if you experience issues when adding or removing objects,
        //-- you may need to comment this line
//        sceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
        sceneView.showsStatistics = true
        #endif
        
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(PhotoARSceneViewController.tap(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        let longTapGestureRecognizer = UILongPressGestureRecognizer(
            target: self,
            action: #selector(PhotoARSceneViewController.longTap(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(longTapGestureRecognizer)
        
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(PhotoARSceneViewController.pan(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(panGestureRecognizer)
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(
            target: self,
            action: #selector(PhotoARSceneViewController.pinch(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(pinchGestureRecognizer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func addPictureNode(_ hitPlane: ARHitTestResult, image: UIImage?) {
        
        if let anchor = hitPlane.anchor as? ARPlaneAnchor {
            
            let anchorId = anchor.identifier
            if pictures[anchorId] == nil {
                
                let transform = hitPlane.worldTransform
                planes[anchorId]?.childNodes[0].removeFromParentNode()
                guard let node = pictureNode(image: image) else { return }
                
                node.transform = SCNMatrix4(anchor.transform)
                node.eulerAngles = SCNVector3(node.eulerAngles.x - .pi / 2,
                                              node.eulerAngles.y,
                                              node.eulerAngles.z)
                node.position = SCNVector3(transform.translation)
                sceneView.scene.rootNode.addChildNode(node)
                pictures[anchorId] = node
            }
        }
    }
    
    func objectAtLocation(_ location: CGPoint) -> SCNNode? {
        
        let hitTestOptions = [SCNHitTestOption.boundingBoxOnly : true]
        let hitTest = sceneView.hitTest(location, options: hitTestOptions)
        
        var node : SCNNode?  = nil
        if let hit = hitTest.first {
            node = hit.node
            while (node != nil && node?.name != "rootNode") {
                node = node?.parent
            }
        }
        return node
    }
    
    @objc func longTap(withGestureRecognizer recognizer: UIGestureRecognizer) {
        
        let tapLocation = recognizer.location(in: sceneView)
        if let node = objectAtLocation(tapLocation) {
            node.removeFromParentNode()
            return
        }
        
        if let hitPlane = sceneView.hitTest(tapLocation, types: .existingPlane).first,
            let anchor = hitPlane.anchor as? ARPlaneAnchor {
            
            let anchorId = anchor.identifier
            if let node = pictures[anchorId] {
                let plane = createGrid(anchor)
                planes[anchor.identifier]?.addChildNode(plane)
                pictures.removeValue(forKey: anchorId)
                node.removeFromParentNode()
            }
        }
    }
    
    @objc func tap(withGestureRecognizer recognizer: UIGestureRecognizer) {
        
        let tapLocation = recognizer.location(in: sceneView)
        if objectAtLocation(tapLocation) != nil {
            return
        }
        
        if let hitPlane = sceneView.hitTest(tapLocation, types: .existingPlane).first,
            let anchor = hitPlane.anchor as? ARPlaneAnchor {

            let anchorId = anchor.identifier
            if pictures[anchorId] == nil {
                self.performSegue(withIdentifier: "ShowPhotoCollection", sender: hitPlane)
            }
            return
        }
        
        let hitTest = sceneView.hitTest(tapLocation, types: .featurePoint)
        guard let featurePoint = hitTest.first else { return }
        let rotate = SCNMatrix4MakeRotation(sceneView.session.currentFrame!.camera.eulerAngles.y, 0, 1, 0)
        let scale = SCNMatrix4MakeScale(0.5, 0.5, 0.5)
        
        var transform = simd_mul(featurePoint.worldTransform, simd_float4x4(rotate))
        transform = simd_mul(transform, simd_float4x4(scale))
        
        sceneView.session.add(anchor: Photo3DObjectAnchor(transform: transform))
    }
    
    @objc func pan(withGestureRecognizer recognizer: UIPanGestureRecognizer) {

        if recognizer.state == .began {
            let tapLocation = recognizer.location(in: sceneView)
            guard let node = objectAtLocation(tapLocation) else {
                recognizer.state = .cancelled
                return
            }
            currentNode = node
            lastTranslation = CGPoint.zero
        }
        
        if recognizer.state == .changed {
            
            let translation = recognizer.translation(in: sceneView)
            let dx = Float(translation.x - lastTranslation.x)
            let dy = Float(translation.y - lastTranslation.y)
            let ax = dx / 90.0
            let ay = dy / 120.0
            lastTranslation = translation
            
            let rotateY = SCNMatrix4MakeRotation(ax, 0, 1, 0)
            let rotateX = SCNMatrix4MakeRotation(ay, 1, 0, 0)
            currentNode?.transform = SCNMatrix4Mult(SCNMatrix4Mult(currentNode!.transform, rotateX), rotateY)
        }
    }

    @objc func pinch(withGestureRecognizer recognizer: UIPinchGestureRecognizer) {
        
        if recognizer.state == .began {
            let tapLocation = recognizer.location(in: sceneView)
            guard let node = objectAtLocation(tapLocation) else {
                recognizer.state = .cancelled
                return
            }
            currentNode = node
        }
        
        if recognizer.state == .changed {
            
            let s = Float(recognizer.scale)
            recognizer.scale = 1.0;

            let scale = SCNMatrix4MakeScale(s, s, s)
            currentNode?.transform = SCNMatrix4Mult(currentNode!.transform, scale)
        }
    }
}

extension PhotoARSceneViewController : ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if let anchor = anchor as? Photo3DObjectAnchor {
            DispatchQueue.main.async {
                if let model = anchor.make3DBodyNode() {
                    node.addChildNode(model)
                }
            }
        }
        
        if let anchor = anchor as? ARPlaneAnchor {
            DispatchQueue.main.async {
                let plane = self.useGrid ? createGrid(anchor) : createPlane(anchor)
                self.planes[anchor.identifier] = node
                node.addChildNode(plane)
            }
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        guard let anchor = anchor as? ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }
        
        if (useGrid) {
            updateGrid(planeNode, geometry: plane, anchor: anchor)
        } else {
            updatePlane(planeNode, plane: plane, anchor: anchor)
        }
    }

    func renderer(_ renderer: SCNSceneRenderer,
                  didRemove node: SCNNode,
                  for anchor: ARAnchor) {

        guard anchor is ARPlaneAnchor else { return }
        node.removeFromParentNode()
    }
}

extension PhotoARSceneViewController : ARSessionObserver {

    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
}

extension PhotoARSceneViewController : UINavigationControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let hitPlane = sender as? ARHitTestResult,
            let vc = segue.destination as? ChooserPhotoCollectionViewController {
            vc.callback = { image in
                self.addPictureNode(hitPlane, image: image)
            }
        }
    }
}
