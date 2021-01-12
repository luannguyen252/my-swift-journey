import MetalKit
import SwiftUI

struct MathCanvas: UIViewRepresentable {
    var frame: CGRect
    var delegate: MathView
    
    func makeUIView(context: Context) -> MTKView {
        let view = MTKView(frame: frame, device: delegate.device)
        view.framebufferOnly = false
        view.delegate = delegate
        return view
    }
    
    func updateUIView(_ uiView: MTKView, context: Context) {
        uiView.delegate?.draw(in: uiView)
    }
}

class MathView: NSObject, MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {  }
    
    private var funcName: String
    public var device: MTLDevice?
    private var commandQueue: MTLCommandQueue?
    private var cps: MTLComputePipelineState?
    
    init(funcName: String) {
        self.funcName = funcName
        super.init()
        registShader()
    }
    
    func draw(in view: MTKView) {
        if let drawable = view.currentDrawable,
            let commandBuffer = commandQueue?.makeCommandBuffer(),
            let commandEncoder = commandBuffer.makeComputeCommandEncoder() {
            commandEncoder.setComputePipelineState(cps!)
            commandEncoder.setTexture(drawable.texture, index: 0)
            
            let threadGroupCount = MTLSizeMake(8, 8, 1)
            let threadGroup = MTLSizeMake(drawable.texture.width / threadGroupCount.width, drawable.texture.height / threadGroupCount.height , 1)
            
            commandEncoder.dispatchThreadgroups(threadGroup, threadsPerThreadgroup: threadGroupCount)
            commandEncoder.endEncoding()
            commandBuffer.present(drawable)
            commandBuffer.commit()
        }
    }
    
    private func registShader() {
        device = MTLCreateSystemDefaultDevice()
        commandQueue = device?.makeCommandQueue()
        let library = device?.makeDefaultLibrary()!
        let kernelFunc = library?.makeFunction(name: funcName)
        do {
           try cps = device?.makeComputePipelineState(function: kernelFunc!)
        } catch let error {
            print(error)
        }
    }
}
