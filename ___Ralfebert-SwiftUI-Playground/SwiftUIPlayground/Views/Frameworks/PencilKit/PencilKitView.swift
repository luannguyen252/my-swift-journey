// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import PencilKit
import SwiftUI

struct CanvasRepresentable: UIViewRepresentable {

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.isOpaque = false
        canvasView.drawingPolicy = .anyInput
        canvasView.delegate = context.coordinator
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 1)
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, PKCanvasViewDelegate {}

}

struct PencilKitView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasRepresentable()
    }
}
