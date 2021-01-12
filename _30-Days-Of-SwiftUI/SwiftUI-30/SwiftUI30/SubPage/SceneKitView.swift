import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    let scene = SCNScene(named: "cat.scn")
    
    func makeUIView(context: Context) -> SCNView {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene?.rootNode.addChildNode(cameraNode)
        
        cameraNode.position = SCNVector3(x:0, y:0, z:15)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.light!.color = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        lightNode.position = SCNVector3(x:0, y:0, z:50)
        scene?.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        let scnView = SCNView()
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: UIViewRepresentableContext<SceneKitView>) {
        uiView.scene = scene
        uiView.allowsCameraControl = true
        uiView.showsStatistics = true
        uiView.backgroundColor = .white
    }
}
