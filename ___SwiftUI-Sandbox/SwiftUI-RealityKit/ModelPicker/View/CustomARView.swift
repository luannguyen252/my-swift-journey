//
//  CustomARView.swift
//  ModelPicker
//
//  Created by Fernando Fernandes on 24.07.20.
//

import RealityKit
import ARKit
import FocusEntity

class CustomARView: ARView {

    // MARK: - Properties

    var focusEntity: FocusEntity?

    // MARK: - Lifecycle

    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        setupFocusEntity()
        setupARView()
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        setupFocusEntity()
        setupARView()
    }
}

// MARK: - Private

private extension CustomARView {

    func setupFocusEntity() {
        focusEntity = FocusEntity(on: self, style: .classic(color: UIColor.red))
        focusEntity?.setAutoUpdate(to: true)
    }

    func setupARView() {

        // Uncomment to user ".nonAR" camera.
        //useNonARCameraSample()

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        session.run(config)
    }

    /// From: https://developer.apple.com/forums/thread/122229
    func useNonARCameraSample() {

        // RealityKit now adds and uses a default PerspectiveCamera.
        cameraMode = .nonAR

        // Provide your own PerspectiveCamera.
        // See: https://developer.apple.com/documentation/realitykit/perspectivecamera
        let cameraEntity = PerspectiveCamera()
        cameraEntity.camera.fieldOfViewInDegrees = 140
        let cameraAnchor = AnchorEntity(world: .one)
        cameraAnchor.addChild(cameraEntity)

        scene.addAnchor(cameraAnchor)
    }
}
