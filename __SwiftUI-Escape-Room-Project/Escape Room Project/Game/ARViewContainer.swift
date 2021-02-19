//
//  ARViewContainer.swift
//  Created by Julian Schiavo on 7/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import ARKit
import RealityKit
import SwiftUI

//class ARViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//}

struct ARViewContainer: UIViewRepresentable {
    
    @ObservedObject private var engine = GameEngine.current

    /// Sets the `GameEngine` as the Coordinator, which manages delegate methods for the `ARView`
    public func makeCoordinator() -> GameEngine {
        engine
    }
    
    /// Creates and configures the `ARView` that will be hosted inside the SwiftUI `View`
    public func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: false)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.frameSemantics = []
        configuration.environmentTexturing = .automatic
        
        let supportedVideoFormats = ARWorldTrackingConfiguration.supportedVideoFormats
            .filter { $0.captureDevicePosition == .back }
        configuration.videoFormat = supportedVideoFormats.last ?? configuration.videoFormat
        configuration.providesAudioData = false
        
        let scaleFactor = arView.contentScaleFactor
        arView.contentScaleFactor = scaleFactor * 0.5
        
        arView.renderOptions.insert(.disableMotionBlur)
        
        arView.session.run(configuration, options: [])
        arView.session.delegate = context.coordinator
        
        NotificationCenter.default.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification, object: nil, queue: nil) { _ in
            let scaleFactor = arView.contentScaleFactor
            arView.contentScaleFactor = scaleFactor * 0.6
        }
        
        addCoachingOverlay(to: arView, context: context)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: engine, action: #selector(GameEngine.handleTap))
        arView.addGestureRecognizer(tapGestureRecognizer)
        
        context.coordinator.arView = arView
        return arView
    }
    
    public func updateUIView(_ uiView: ARView, context: Context) {
//        if engine.state == .playing {
//            engine.loadScene()
//        }
        context.coordinator.arView = uiView
    }
    
    // MARK: - Coaching Overlay
    
    private func addCoachingOverlay(to arView: ARView, context: Context) {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.delegate = context.coordinator
        coachingOverlay.session = arView.session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
        coachingOverlay.topAnchor.constraint(equalTo: arView.topAnchor).isActive = true
        coachingOverlay.bottomAnchor.constraint(equalTo: arView.bottomAnchor).isActive = true
        coachingOverlay.leadingAnchor.constraint(equalTo: arView.leadingAnchor).isActive = true
        coachingOverlay.trailingAnchor.constraint(equalTo: arView.trailingAnchor).isActive = true
        
        context.coordinator.arCoachingOverlayView = coachingOverlay
    }
}
