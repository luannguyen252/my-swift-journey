import MetalKit
import simd
import GLKit

class MetalView: MTKView {
    private var commandQueue: MTLCommandQueue?
    private var rps: MTLRenderPipelineState?
    private var vertexBuffer: MTLBuffer?
    private var uniformBuffer: MTLBuffer?
    private var indexBuffer: MTLBuffer?
    
    private var projectionMatrix: GLKMatrix4!
    private var viewMatrix: GLKMatrix4!
    private var modelMatrix: GLKMatrix4!
    
//    private var projectionMatrix: Matrix!
//    private var viewMatrix: Matrix!
//    private var modelMatrix: Matrix!
    
    private var cameraPosition: vector_float3!
    
    private var theta: Float = Float.pi / 400
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        device = MTLCreateSystemDefaultDevice()
        initProjection()
        initViewMatrix()
        initModelMatrix()
        modelMatrix = GLKMatrix4MakeScale(0.5, 0.5, 0.5)
        createBuffer()
        registerShader()
    }
    
    required override init(frame frameRect: CGRect, device: MTLDevice?) {
        super.init(frame: frameRect, device: device)
        initProjection()
        initViewMatrix()
        initModelMatrix()
        createBuffer()
        registerShader()
    }
    
    private func initProjection(){
        let aspect = Float(drawableSize.width / drawableSize.height)
        print("aspect = \(aspect)")
        projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(90), aspect, 0.01, 100)
    }
    
    private func initViewMatrix(){
        cameraPosition = vector3(0, 0, 2)
        viewMatrix = GLKMatrix4MakeTranslation(-cameraPosition.x, -cameraPosition.y, -cameraPosition.z)
    }
    
    private func initModelMatrix(){
        modelMatrix = GLKMatrix4MakeScale(0.5, 0.5, 0.5)
        modelMatrix = GLKMatrix4RotateX(modelMatrix, Float.pi / 4)
    }
    
    override func draw(_ rect: CGRect) {
        if let drawable = currentDrawable,
            let rpd = currentRenderPassDescriptor {
            rpd.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
            rpd.colorAttachments[0].loadAction = .clear
            
            let commandBuffer = commandQueue?.makeCommandBuffer()
            let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: rpd)
            
            commandEncoder?.setRenderPipelineState(rps!)
            commandEncoder?.setFrontFacing(.counterClockwise)
            commandEncoder?.setCullMode(.back)
            
            commandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
            commandEncoder?.setVertexBuffer(uniformBuffer, offset: 0, index: 1)
            commandEncoder?.drawIndexedPrimitives(type: .triangle, indexCount: indexBuffer!.length / MemoryLayout<UInt16>.size, indexType: MTLIndexType.uint16, indexBuffer: indexBuffer!, indexBufferOffset: 0)
            commandEncoder?.endEncoding()
            
            commandBuffer?.present(drawable)
            commandBuffer?.commit()
            
            updateView()
        }
    }
    
    func createBuffer() {
        commandQueue = device?.makeCommandQueue()
        let vertexData = [Vertex(position: [-0.5, -0.5, 0.0, 1.0], color: [1,0,0,1]),
                          Vertex(position: [0.5, -0.5, 0.0, 1.0], color: [0,1,0,1]),
                          Vertex(position: [0.5, 0.5, 0.0, 1.0], color: [0,0,1,1]),
                          Vertex(position: [-0.5, 0.5, 0.0, 1.0], color: [0,0,0,1]),
                          Vertex(position: [-0.5, -0.5, -0.5, 1.0], color: [0,1,1,1]),
                          Vertex(position: [0.5, -0.5, -0.5, 1.0], color: [1,0,1,1]),
                          Vertex(position: [0.5, 0.5, -0.5, 1.0], color: [1,1,0,1]),
                          Vertex(position: [-0.5, 0.5, -0.5, 1.0], color: [1,1,1,1])
        ]
        
        let vertexIndex:[UInt16] = [0, 1, 2, 2, 3, 0, // Front
                                    4, 0, 3, 3, 7, 4, // Left
                                    3, 2, 6, 6, 7, 3, // Top
                                    7, 6, 5, 5, 4, 7, // Back
                                    1, 5, 6, 6, 2, 1, // Right
                                    4, 5, 1, 1, 0, 4  // Bottom
        ]
        
        vertexBuffer = device?.makeBuffer(bytes: vertexData, length: vertexData.count * MemoryLayout<Vertex>.size, options: [])
        uniformBuffer = device?.makeBuffer(length: MemoryLayout<Uniforms>.size, options: [])
        indexBuffer = device?.makeBuffer(bytes: vertexIndex, length: vertexIndex.count * MemoryLayout<UInt16>.size, options: [])
        
        print("indexCount = \(indexBuffer!.length / MemoryLayout<UInt16>.size)")
        
        let bufferPointer = uniformBuffer?.contents()
        let MVP = viewMatrix * modelMatrix
        print(MVP)
        var uniforms = Uniforms(MVP: MVP)
        print("uniform size = \(MemoryLayout<Uniforms>.size) float size = \(16 * MemoryLayout<Float>.size)")
        memcpy(bufferPointer, withUnsafePointer(to: &uniforms, {$0}), MemoryLayout<Uniforms>.size)
        
    }
    
    func registerShader() {
        let library = device?.makeDefaultLibrary()! // Create a shader
        let vertexFunc = library?.makeFunction(name: "vertex_func") // Create functions
        let fragmentFunc = library?.makeFunction(name: "fragment_func")
        let rpld = MTLRenderPipelineDescriptor()
        
        rpld.vertexFunction = vertexFunc
        rpld.fragmentFunction = fragmentFunc
        rpld.colorAttachments[0].pixelFormat = .bgra8Unorm // Blue green red alpha 8 bit
        
        do {
            try rps = device?.makeRenderPipelineState(descriptor: rpld)
        }
        catch let error
        {
            fatalError("\(error)")
        }
    }
    
    func updateView() {
        modelMatrix = GLKMatrix4RotateY(modelMatrix, theta)
        let bufferPointer = uniformBuffer?.contents()
        let MVP = projectionMatrix * viewMatrix * modelMatrix
        var uniform = Uniforms(MVP: MVP)
        memcpy(bufferPointer, withUnsafePointer(to: &uniform, {$0}), MemoryLayout<Uniforms>.size)
    }
}
