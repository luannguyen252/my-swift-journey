import UIKit
import SpriteKit
import GameplayKit
import SceneKit

final class StellarSystemView: SCNView {
    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        addScene()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addScene() {
        let cameraNode = SCNNode()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 18)
        cameraNode.camera = camera()
        
        self.scene = StellarSystemScene()
        self.pointOfView = cameraNode
        self.autoenablesDefaultLighting = false
        self.allowsCameraControl = true // allows the user to manipulate the camera
        self.showsStatistics = false // show statistics such as fps and timing information
        self.backgroundColor = .clear
        self.scene?.background.contents = UIImage(named: "galaxy")
        self.play(nil)
    }
    
    private func camera() -> SCNCamera {
        let camera = SCNCamera()
        camera.wantsHDR = true
        camera.bloomThreshold = 0.8
        camera.bloomIntensity = 2
        camera.bloomBlurRadius = 16.0
        camera.wantsExposureAdaptation = false
        return camera
    }
}
