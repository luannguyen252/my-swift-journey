import SwiftUI

struct MetalCanvas: UIViewRepresentable {
    var frame: CGRect
    var device: MTLDevice?
    
    func makeUIView(context: Context) -> MetalView {
        let metalView = MetalView(frame: frame, device: device)
        return metalView
    }
    
    func updateUIView(_ uiView: MetalView, context: UIViewRepresentableContext<MetalCanvas>) {
        uiView.draw(frame)
    }
}
