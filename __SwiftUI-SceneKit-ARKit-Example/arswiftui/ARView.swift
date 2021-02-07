//
//  ARView.swift
//  arswiftui
//
//  Created by Romain on 04/02/2020.
//  Copyright © 2020 Romain. All rights reserved.
//

import SwiftUI
import ARKit

struct ARView : UIViewRepresentable {
	
	func makeUIView(context: Context) -> ARSCNView {
		let scnView = ARSCNView()
		let configuration = ARWorldTrackingConfiguration()
		configuration.planeDetection = .horizontal
		configuration.environmentTexturing = .automatic
		scnView.session.run(configuration, options: [])
		scnView.delegate = context.coordinator
		scnView.autoenablesDefaultLighting = true
		return scnView
	}
	
	func updateUIView(_ uiView: ARSCNView, context: Context) {
		
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	class Coordinator: NSObject, ARSCNViewDelegate {
		
		let parent : ARView
		init(_ parent : ARView) {
			self.parent = parent
		}
		
		func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
			guard anchor is ARPlaneAnchor else {return}
			
			let torus = SCNTorus(ringRadius: 0.1, pipeRadius: 0.01)
			node.geometry = torus
			torus.firstMaterial = chrome

		}
		
		var chrome : SCNMaterial {
			let material = SCNMaterial()
			material.lightingModel = .physicallyBased
			material.roughness.contents = 0.1
			material.metalness.contents = 1
			return material
		}
	}
	
	
}
