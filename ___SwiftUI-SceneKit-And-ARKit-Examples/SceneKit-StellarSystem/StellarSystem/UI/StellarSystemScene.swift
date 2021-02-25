import SceneKit

final class StellarSystemScene: SCNScene {
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init () {
        super.init()
        
        rootNode.castsShadow = false
        
        // Sun-group
        let sunGroupNode = SCNNode()
        sunGroupNode.castsShadow = false
        sunGroupNode.position = SCNVector3Make(0, 0, 0)
        rootNode.addChildNode(sunGroupNode)
        
        // Sun Lights
        sunGroupNode.addChildNode(SunLightNode(angle: -Float(Double.pi/2)))
        sunGroupNode.addChildNode(SunLightNode(angle: -Float(Double.pi/4)))
        sunGroupNode.addChildNode(SunLightNode(angle: -Float(Double.pi/8)))
        sunGroupNode.addChildNode(SunLightNode(angle: 0))
        
        // Sun
        let sunNode = SphereNode("sun", radius: 1.5, lightningModel: .constant, duration: 20.0)
        sunGroupNode.addChildNode(sunNode)
        
        // Mercury-group
        let mercuryRotationNode = PlanetRotationNode(angle: 0)
        let mercuryNode = SphereNode("mercury", radius: 0.4, position: SCNVector3Make(3, 0, 0))
        mercuryRotationNode.addChildNode(mercuryNode)
        sunGroupNode.addChildNode(mercuryRotationNode)
        
        // Venus-group
        let venusRotationNode = PlanetRotationNode(angle: Float(Double.pi/8))
        let venusNode = SphereNode("venus", radius: 0.9, position: SCNVector3Make(6, 0, 0))
        venusRotationNode.addChildNode(venusNode)
        sunGroupNode.addChildNode(venusRotationNode)
        
        // Earth-group (will contain the Earth and the Moon)
        let earthRotationNode = PlanetRotationNode(angle: Float(Double.pi/4))
        let earthNode = SphereNode("earth", castsShadow: true, radius: 1.0)
        let moonNode = SphereNode("moon", castsShadow: true, radius: 0.5, position: SCNVector3Make(2, 0, 0))
        let earthGroupNode = SphereGroupNode(sphereNodes: [earthNode, SatelliteRotationNode(satelliteNode: moonNode)], position: SCNVector3Make(10, 0, 0))
        earthRotationNode.addChildNode(earthGroupNode)
        sunGroupNode.addChildNode(earthRotationNode)
        
        // Mars-group (will contain Mars, Phobos and Deimos)
        let marsRotationNode = PlanetRotationNode(angle: Float(Double.pi/2))
        let marsNode = SphereNode("mars", radius: 0.8)
        let phobosNode = SphereNode("moon", castsShadow: true, radius: 0.3, position: SCNVector3Make(2, 0, 0))
        let deimosNode = SphereNode("moon", castsShadow: true, radius: 0.15, position: SCNVector3Make(4, 0, 0))
        let marsGroupNode = SphereGroupNode(sphereNodes: [marsNode, SatelliteRotationNode(satelliteNode: phobosNode), SatelliteRotationNode(satelliteNode: deimosNode)], position: SCNVector3Make(16, 0, 0))
        marsRotationNode.addChildNode(marsGroupNode)
        sunGroupNode.addChildNode(marsRotationNode)
        
        // Borg
        //sunGroupNode.addChildNode(BorgNode(position: SCNVector3(3, 3, 0)))
    }
}
