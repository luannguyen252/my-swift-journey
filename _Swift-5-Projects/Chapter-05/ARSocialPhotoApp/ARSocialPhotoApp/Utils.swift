//
//  Utils.swift
//  Photos
//
//  Created by sergio on 03/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import Foundation
import Photos
import Firebase
import SceneKit
import ARKit

func URLIntoDocuments(_ component: String) -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                      in: .userDomainMask).first!
    return documentsDirectory.appendingPathComponent(component)
}

func checkPhotoLibraryPermission() {
    let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    switch photoAuthorizationStatus {
    case .authorized:
        print("Access already granted")
    case .notDetermined:
        PHPhotoLibrary.requestAuthorization({
            (newStatus) in
            if newStatus == PHAuthorizationStatus.authorized {
                print("Access granted")
            }
        })
    case .restricted:
        print("Access unavailable to user.")
    case .denied:
        // same same
        print("Access denied.")
    @unknown default:
        print("Unrecoverable error: unkwnown PHAuthorizationStatus case")
    }
}

func copyImage(src image: UIImage, name: String) -> URL? {
    
    let fileURL = URLIntoDocuments(name)
    if let data = image.jpegData(compressionQuality:  1.0),
        !FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            try data.write(to: fileURL)
            print("File \(fileURL) copied")
            return fileURL
        } catch {
            print("Error copying file:", error)
        }
    }
    return nil
}

func removeImage(filename: String) {
    let fileURL = URLIntoDocuments(filename)
    if FileManager.default.fileExists(atPath: fileURL.path) {
        try? FileManager.default.removeItem(at: fileURL)
    }
}

func placeholderImage(filename: String) -> UIImage? {
    let fileURL = URLIntoDocuments(filename)
    if FileManager.default.fileExists(atPath: fileURL.path),
        let placeholder = UIImage(contentsOfFile: URLIntoDocuments(filename).path) {
        return  placeholder
    }
    return UIImage(named: "Downloading")
}

extension UIImageView {
    
    func setImage(storageChild: String) {
        let storage = Storage.storage()
        let placeholder = placeholderImage(filename: storageChild)
        print("Trying to download placeholder \(storageChild)")
        self.sd_setImage(with: storage.reference().child(storageChild),
                              placeholderImage: placeholder) { (image, error, type, url) in
        }
    }
}

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

func createPlane(_ anchor: ARPlaneAnchor) -> SCNNode {
    
    let width = CGFloat(anchor.extent.x)
    let height = CGFloat(anchor.extent.z)
    let extentPlane = SCNPlane(width: width, height: height)
    extentPlane.materials.first?.diffuse.contents = UIColor(red: 0.25, green: 0.25, blue: 0.75, alpha: 0.5)
    
    let extentNode = SCNNode(geometry: extentPlane)
    extentNode.simdPosition = anchor.center
    extentNode.eulerAngles.x = -.pi / 2
    
    return extentNode
}

func updatePlane(_ node: SCNNode, plane: SCNPlane, anchor: ARPlaneAnchor) {
    
    plane.width = CGFloat(anchor.extent.x)
    plane.height = CGFloat(anchor.extent.z)
    
    node.simdPosition = anchor.center
}

func createGrid(_ anchor: ARPlaneAnchor) ->SCNNode {
    
    let geometry = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
    
    let material = SCNMaterial()
    material.diffuse.contents = UIImage(named:"Grid")
    
    geometry.materials = [material]
    let node = SCNNode(geometry: geometry)
    node.physicsBody =
        SCNPhysicsBody(type: .static,
                       shape: SCNPhysicsShape(geometry: geometry, options: nil))
    node.physicsBody?.categoryBitMask = 2
    
    node.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z);
    node.transform = SCNMatrix4MakeRotation(Float(-.pi/2.0), 1.0, 0.0, 0.0);
    
    return node
}

func updateGrid(_ node: SCNNode, geometry: SCNPlane, anchor: ARPlaneAnchor) {
    
    geometry.width = CGFloat(anchor.extent.x);
    geometry.height = CGFloat(anchor.extent.z);
    node.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z);
    
    node.physicsBody =
        SCNPhysicsBody(type: .static,
                       shape: SCNPhysicsShape(geometry: geometry, options: nil))
}

func pictureNode(image: UIImage?) -> SCNNode? {
    
    let node = SCNNode(geometry: SCNPlane(width: 0.25, height: 0.25))
    
    let material = SCNMaterial()
    material.diffuse.contents = image
    node.geometry?.materials = [material]
    node.physicsBody? = .static()
    
    return node
}

func pictureNode(_ name: String = "ImageOnTheWall") -> SCNNode? {
    
    return pictureNode(image:UIImage(named: name))
}
